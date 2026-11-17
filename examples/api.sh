#!/usr/bin/env bash
# Bookare REST API: first calls. Replace VENUE with a venue's address name (the "name" in name.bookare.app).
# Full reference: https://docs.bookare.app/developers · OpenAPI: ../openapi.json
set -euo pipefail
VENUE=${VENUE:-eleftheriakinisis}
API="https://$VENUE.bookare.app/api/v1"

# 1. Public, no key: the venue and what it offers
curl -s "$API/public/venue"
curl -s "$API/public/classes"        # gyms and studios: the next days' classes with free spots
curl -s "$API/public/packs"          # packs on sale

# 2. Admin, with an API key (Settings → Assistant and API → API key). Read only first.
if [[ -n "${BOOKARE_KEY:-}" ]]; then
  curl -s "$API/admin/venue" -H "Authorization: Bearer $BOOKARE_KEY"
  curl -s "$API/admin/members?search=maria" -H "Authorization: Bearer $BOOKARE_KEY"
  # With a "read and change" key:
  # curl -s -X POST "$API/admin/packs" -H "Authorization: Bearer $BOOKARE_KEY" -H "Content-Type: application/json" \
  #   -d '{"name":"10 classes","classes":10,"valid_days":60,"price_eur":95}'
fi

# 3. A customer signs in with an email code, then reads their packs
# curl -s -X POST "$API/auth/code"  -H "Content-Type: application/json" -d '{"email":"maria@example.com"}'
# curl -s -X POST "$API/auth/token" -H "Content-Type: application/json" -d '{"email":"maria@example.com","code":"123456","challenge":"..."}'
# curl -s "$API/me/packs" -H "Authorization: Bearer <customer token>"
