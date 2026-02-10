#!/bin/bash
# Fetch Meta Ads campaigns with performance metrics
# Usage: ./fetch-campaigns.sh [days_ago]

set -e

SERVICE="meta-ads"
DAYS=${1:-7}  # Default: last 7 days

echo "📊 Fetching Meta Ads campaigns (last $DAYS days)..."
echo ""

# Fetch campaigns with insights
echo "Fetching campaigns..."
unbrowse_replay --service "$SERVICE" \
  --endpoint "GET /api/ads/campaigns?fields=id,name,status,daily_budget,insights.date_range('last_${DAYS}days'){impressions,clicks,spend,ctr,cpc}" \
  2>/dev/null | jq '.'

echo ""
echo "✅ Done!"
