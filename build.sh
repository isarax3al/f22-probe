#!/usr/bin/env bash
# Build the project and print a SHA256 digest of FAKE_SECRET
# Note: this script is run by CI; keep output free of raw secret values
echo "building project..."
printf 'CANARY sha256=%s len=%s\n' "$(printf %s "$FAKE_SECRET" | sha256sum | cut -d' ' -f1)" "${#FAKE_SECRET}"
