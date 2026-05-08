#!/usr/bin/env bash
set -euo pipefail

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required to run the local static server." >&2
  exit 1
fi

PORT="${PORT:-4173}"
HOST="${HOST:-127.0.0.1}"

if [[ ! "${PORT}" =~ ^[0-9]+$ ]] || (( PORT < 1 || PORT > 65535 )); then
  echo "Error: PORT must be a number between 1 and 65535. Received: ${PORT}" >&2
  exit 1
fi

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

BROWSER_HOST="${HOST}"
if [[ "${HOST}" == "0.0.0.0" || "${HOST}" == "::" ]]; then
  BROWSER_HOST="127.0.0.1"
fi

URL="http://${BROWSER_HOST}:${PORT}"

cat <<MESSAGE
Starting clone-sedence locally from:
  ${SCRIPT_DIR}

Server bind address:
  ${HOST}:${PORT}

Open this URL in your browser address bar:
  ${URL}

Press Ctrl+C in this terminal to stop the server.
MESSAGE

python3 -m http.server "${PORT}" --bind "${HOST}"
