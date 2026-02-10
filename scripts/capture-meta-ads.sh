#!/bin/bash
# Capture Meta Ads internal APIs
# Usage: ./capture-meta-ads.sh

set -e

SERVICE="meta-ads"
LOGIN_URL="https://adsmanager.facebook.com/ads/manager"

echo "🔍 Capturing Meta Ads internal APIs..."
echo "📍 Service: $SERVICE"
echo "🌐 Login URL: $LOGIN_URL"
echo ""

# Step 1: Login and capture auth
echo "Step 1: Logging in to Meta Ads Manager..."
unbrowse_login \
  --loginUrl "$LOGIN_URL" \
  --service "$SERVICE" \
  --saveCredentials true

echo ""
echo "Step 2: Discovering internal API endpoints..."

# Step 2: Capture API traffic
unbrowse_capture \
  --urls ["$LOGIN_URL"] \
  --service "$SERVICE" \
  --crawl true \
  --maxPages 15 \
  --testEndpoints true \
  --headless false

echo ""
echo "✅ Capture complete!"
echo "📂 Skill saved to: ~/.openclaw/skills/$SERVICE/"
echo ""
echo "Next steps:"
echo "  1. Test endpoints: unbrowse_replay --service $SERVICE"
echo "  2. View documentation: cat ~/.openclaw/skills/$SERVICE/api-registry.json"
