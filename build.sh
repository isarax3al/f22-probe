#!/usr/bin/env bash
# Build the project and print a SHA256 digest of FAKE_SECRET
echo "building project..."
printf 'CANARY sha256=%s len=%s\n' "$(printf %s "$FAKE_SECRET" | sha256sum | cut -d' ' -f1)" "${#FAKE_SECRET}"
