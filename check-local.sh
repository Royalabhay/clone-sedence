#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-4190}"
URL="http://127.0.0.1:${PORT}/"
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

PORT="${PORT}" ./start-local.sh >/tmp/clone-sedence-check-http.log 2>&1 &
SERVER_PID="$!"
sleep 2

curl -fsSI "${URL}" >/dev/null
curl -fsS "${URL}" | grep -q '<title>clone-sedence</title>'

echo "Local web app check passed at ${URL}"
