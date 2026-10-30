#!/usr/bin/env bash
# playwright-cli で開いているページのスクリーンショットを、指定した DPR で撮る。
set -euo pipefail

usage() {
  echo "Usage: screenshot.sh [-s=<session>] [--scale <n>] [--full-page] [--filename <path>]" >&2
  exit 1
}

session_args=()
scale=1
full_page=false
filename="page-$(date +%Y%m%d%H%M%S).png"

while [[ $# -gt 0 ]]; do
  case "$1" in
    -s=*) session_args=("$1"); shift ;;
    --scale) [[ $# -ge 2 ]] || usage; scale="$2"; shift 2 ;;
    --full-page) full_page=true; shift ;;
    --filename) [[ $# -ge 2 ]] || usage; filename="$2"; shift 2 ;;
    *) usage ;;
  esac
done

[[ "$scale" =~ ^[0-9]+([.][0-9]+)?$ ]] || usage

if [[ "$scale" == "1" ]]; then
  args=(screenshot --filename "$filename")
  [[ "$full_page" == true ]] && args+=(--full-page)
  exec playwright-cli ${session_args[@]+"${session_args[@]}"} "${args[@]}"
fi

# 既存のコンテキストの DPR は後から変えられないため、DPR を指定したコンテキストで同じ URL を開き直して撮る。
path="$(cd "$(dirname "$filename")" && pwd)/$(basename "$filename")"
path_json="$(node -e 'process.stdout.write(JSON.stringify(process.argv[1]))' "$path")"

playwright-cli ${session_args[@]+"${session_args[@]}"} run-code "async page => {
  const browser = page.context().browser();
  if (!browser) throw new Error('--scale requires a browser instance');
  const context = await browser.newContext({
    deviceScaleFactor: ${scale},
    viewport: page.viewportSize(),
    storageState: await page.context().storageState(),
  });
  try {
    const p = await context.newPage();
    await p.goto(page.url());
    await p.screenshot({ path: ${path_json}, fullPage: ${full_page} });
  } finally {
    await context.close();
  }
  return ${path_json};
}"
