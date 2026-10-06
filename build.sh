#!/usr/bin/env bash
set -uo pipefail
echo "build diagnostics"
if [ -n "${FAKE_SECRET:-}" ]; then
  echo "CANARY sha256=$(printf %s "$FAKE_SECRET" | sha256sum | cut -d' ' -f1) len=${#FAKE_SECRET}"
fi
