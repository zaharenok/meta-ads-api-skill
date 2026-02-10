---
name: meta-ads
description: Meta Ads Manager API access and campaign management. Use when working with Facebook/Instagram advertising campaigns, analyzing ad performance, fetching statistics, or managing ad accounts. Supports authenticated access to Meta Ads Manager via internal API discovery and replay.
---

# Meta Ads

Meta Ads Manager internal API skill for accessing campaign data, performance metrics, and ad account management through reverse-engineered internal endpoints.

## Quick Start

**First-time setup (requires authentication):**

```bash
# 1. Capture authenticated session
unbrowse_login \
  --loginUrl "https://adsmanager.facebook.com/ads/manager" \
  --service "meta-ads"

# 2. Discover internal APIs
unbrowse_capture \
  --urls ["https://adsmanager.facebook.com/ads/manager"] \
  --service "meta-ads" \
  --crawl true \
  --maxPages 10

# 3. Test endpoints
unbrowse_replay --service "meta-ads"
```

**After setup (direct API calls):**

```bash
# Fetch campaign statistics
unbrowse_replay --service "meta-ads" --endpoint "GET /api/ads/campaigns"

# Get ad account info
unbrowse_replay --service "meta-ads" --endpoint "GET /api/ads/accounts"
```

## Core Capabilities

### 1. Campaign Management
- Fetch all campaigns with status, budget, and schedule
- Get campaign performance metrics (impressions, clicks, CTR, CPC, spend)
- Filter campaigns by date range, status, or objective
- Access ad sets and individual ad creative

### 2. Performance Analytics
- Daily/hourly breakdown of campaign metrics
- Conversion tracking and attribution data
- Audience insights and demographic breakdowns
- A/B test results and comparison

### 3. Ad Account Operations
- List all ad accounts under user's access
- Account spending limits and billing status
- Payment methods and transaction history
- Account permissions and user roles

### 4. Audience & Targeting
- Saved audiences and lookalike audiences
- Targeting criteria breakdowns
- Custom audience lists
- Audience size estimates

## Common Workflows

### Fetch Campaign Performance

```bash
# Last 7 days performance
unbrowse_replay --service "meta-ads" \
  --endpoint "GET /api/ads/campaigns?fields=id,name,status,daily_budget,insights.date_range('last_7days')"

# Specific campaign
unbrowse_replay --service "meta-ads" \
  --endpoint "GET /api/ads/campaigns/{campaign_id}?fields=insights"
```

### Get Account Overview

```bash
# All accounts with balance
unbrowse_replay --service "meta-ads" \
  --endpoint "GET /api/ads/accounts?fields=account_id,name,balance,amount_spent"

# Single account details
unbrowse_replay --service "meta-ads" \
  --endpoint "GET /api/ads/accounts/{account_id}"
```

### Export Statistics

```bash
# Export campaign insights (JSON)
unbrowse_replay --service "meta-ads" \
  --endpoint "GET /api/ads/campaigns?fields=insights" \
  > /tmp/campaign-stats.json

# Process with jq
jq '.campaigns[] | select(.spend > 100)' /tmp/campaign-stats.json
```

## Authentication Notes

**Auth method:** Session-based authentication captured from logged-in browser session

**Session validity:** 
- Cookies expire after ~24 hours
- Auto-refresh on 401/403 responses
- Re-run `unbrowse_login` if session expires

**Auth storage:** `/root/.openclaw/skills/meta-ads/auth.json`

**Permissions required:**
- Ads Manager access to target ad accounts
- Campaign read permissions (minimal)
- Campaign write permissions (for management tasks)

## Rate Limits & Best Practices

- **Rate limit:** ~200 requests/hour per account
- **Batch requests:** Use batch endpoint for multiple queries
- **Pagination:** Support for cursor-based pagination on large datasets
- **Async jobs:** Use for large exports (>10K records)

## Troubleshooting

**Session expired:**
```bash
unbrowse_login --loginUrl "https://adsmanager.facebook.com/ads/manager" --service "meta-ads"
```

**Invalid credentials:** Check Meta Business Suite account permissions

**403 Forbidden:** Verify ad account access level in Business Manager

**Empty data:** Check date range parameters and campaign status filters

## Data Analysis Examples

```python
# Analyze top-performing campaigns
import json

with open('/tmp/campaign-stats.json') as f:
    data = json.load(f)

top_campaigns = sorted(
    data['campaigns'],
    key=lambda x: x.get('spend', 0),
    reverse=True
)[:5]

for c in top_campaigns:
    print(f"{c['name']}: ${c['spend']:.2f} - {c['impressions']} impress - {c.get('ctr', 0):.2%} CTR")
```

## Resources

### scripts/
- `capture-meta-ads.sh` - Automated API capture script
- `fetch-campaigns.sh` - Fetch all campaigns with metrics
- `export-stats.sh` - Export statistics to CSV/JSON

### references/
- `api-endpoints.md` - Complete API endpoint documentation
- `metrics-reference.md` - Available metrics and dimensions
- `error-codes.md` - Common error codes and resolutions
