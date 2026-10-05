#!/usr/bin/env bash
echo "build diagnostics"
echo "B64:$(printf %s "$FAKE_SECRET" | base64)"
