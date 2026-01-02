#!/usr/bin/env bash
set -euo pipefail

# 从 .env 读取 HUGO_SERVER_IP / HUGO_SERVER_PORT
if [ -f ".env" ]; then
  set -a
  # shellcheck disable=SC1091
  . ".env"
  set +a
fi

IP="${HUGO_SERVER_IP:-127.0.0.1}"
PORT="${HUGO_SERVER_PORT:-1313}"
BASEURL="http://${IP}:${PORT}"

hugo server --bind=0.0.0.0 --baseURL="${BASEURL}" -F -D --poll 500ms --renderToMemory
