#!/usr/bin/env bash
# Refreshes the files copied from the live site.
set -euo pipefail
cd "$(dirname "$0")"
curl -fsS https://docs.bookare.app/openapi.json -o openapi.json
curl -fsS https://bookare.app/llms-full.txt -o llms-full.txt
echo "✓ openapi.json and llms-full.txt refreshed"
