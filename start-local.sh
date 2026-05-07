#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-4173}"
HOST="${HOST:-127.0.0.1}"
URL="http://${HOST}:${PORT}"

cat <<MESSAGE
Starting clone-sedence locally...

Open this URL in your browser:
  ${URL}

Press Ctrl+C in this terminal to stop the server.
MESSAGE

python3 -m http.server "${PORT}" --bind "${HOST}"
