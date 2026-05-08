#!/usr/bin/env bash
set -euo pipefail

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required to parse and serve the static page." >&2
  exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "Error: curl is required to verify the local HTTP response." >&2
  exit 1
fi

PORT="${PORT:-4190}"
HOST="${HOST:-127.0.0.1}"

if [[ ! "${PORT}" =~ ^[0-9]+$ ]] || (( PORT < 1 || PORT > 65535 )); then
  echo "Error: PORT must be a number between 1 and 65535. Received: ${PORT}" >&2
  exit 1
fi

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

URL="http://${HOST}:${PORT}/"
SERVER_PID=""

cleanup() {
  if [[ -n "${SERVER_PID}" ]] && kill -0 "${SERVER_PID}" >/dev/null 2>&1; then
    kill "${SERVER_PID}"
    wait "${SERVER_PID}" 2>/dev/null || true
  fi
}
trap cleanup EXIT

bash -n start-local.sh
python3 - <<'PY'
from html.parser import HTMLParser
from pathlib import Path

HTMLParser().feed(Path('index.html').read_text())
print('index.html parsed')
PY

PORT="${PORT}" HOST="${HOST}" ./start-local.sh >/tmp/clone-sedence-check-http.log 2>&1 &
SERVER_PID="$!"

for _ in {1..20}; do
  if curl -fsSI "${URL}" >/dev/null 2>&1; then
    break
  fi
  sleep 0.25
done

curl -fsSI "${URL}" >/dev/null
curl -fsS "${URL}" | grep -q '<title>clone-sedence</title>'

echo "Local web app check passed at ${URL}"
echo "No Playwright, npx, or Chromium download is required for this check."
