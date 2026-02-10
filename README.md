<div align="center">

# 🎯 Meta Ads API Toolkit

**The ultimate Meta Ads automation toolkit for developers and marketers**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Skill-blue)](https://docs.openclaw.ai)
[![Stars](https://img.shields.io/github/stars/zaharenok/meta-ads-api-skill?style=social)](https://github.com/zaharenok/meta-ads-api-skill/stargazers)

**Technical API access** + **AI-powered marketing** = Complete Meta Ads solution

[Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Examples](#-examples)

</div>

---

## 🚀 Why Meta Ads API Toolkit?

Meta's official Ads API is complex and requires business verification. **This toolkit bypasses all that** by reverse-engineering the internal APIs used by Ads Manager itself.

✅ **No API approval needed** — Works with any Meta Ads account
✅ **Full access** — Campaigns, analytics, audiences, insights
✅ **AI-powered** — Generate ad copy and build audiences automatically
✅ **Battle-tested** — Marketing frameworks from top-performing ad specialists

## 📦 What's Inside?

### 🔧 Technical API Access
- **Campaign Analytics** — Impressions, clicks, CTR, CPC, spend, conversions
- **Account Management** — All ad accounts, budgets, billing status
- **Performance Insights** — Daily/hourly breakdowns, A/B test results
- **Audience Data** — Demographics, targeting criteria, lookalikes

### 🤖 AI-Powered Marketing
- **Ad Copy Generator** — 3 proven frameworks (direct response, lead gen, brand awareness)
- **Audience Builder** — Tiered strategy from first-party to interest-based
- **Creative Analyzer** — Performance breakdown by creative elements
- **Marketing Prompts** — Professional frameworks from [labofideas/ads-skills](https://github.com/labofideas/ads-skills)

---

## 🎯 Quick Start (3 minutes)

### Prerequisites
- [OpenClaw](https://docs.openclaw.ai) installed
- Meta Ads Manager account (any level)

### 1. Clone & Setup

```bash
git clone https://github.com/zaharenok/meta-ads-api-skill.git
cd meta-ads-api-skill
chmod +x scripts/*.sh
```

### 2. Capture API (one-time)

```bash
./scripts/capture-meta-ads.sh
```

This will:
- Open Meta Ads Manager in your browser
- Capture internal API endpoints
- Save authentication tokens
- Discover all available endpoints

### 3. Start Using!

```bash
# Fetch campaign statistics
./scripts/fetch-campaigns.sh 7

# Generate ad copy
./scripts/generate-ad-copy.sh "fitness app" "busy professionals 25-45" "start free trial"

# Build audience strategy
./scripts/build-audiences.sh "busy professionals 25-45, want to lose 5-20kg"
```

---

## 💡 Use Cases

### For Developers
```bash
# Export all campaigns with metrics
unbrowse_replay --service meta-ads \
  --endpoint "GET /api/ads/campaigns?fields=insights" \
  > campaigns.json

# Get top performers by ROAS
jq '.campaigns[] | select(.roas > 3.0)' campaigns.json
```

### For Marketers
```bash
# Generate 3 ad variations for A/B testing
./scripts/generate-ad-copy.sh \
  "SaaS project management tool" \
  "startup founders, product managers" \
  "start 14-day free trial" \
  "professional"
```

### For Agencies
```bash
# Build comprehensive audience strategy for new client
./scripts/build-audiences.sh \
  "e-commerce fashion brand, target women 25-45, interested in sustainable fashion"

# Fetch client account overview
unbrowse_replay --service meta-ads \
  --endpoint "GET /api/ads/accounts?fields=account_id,name,balance,amount_spent"
```

---

## 📚 Documentation

| File | Description |
|------|-------------|
| **[SKILL.md](SKILL.md)** | Complete OpenClaw integration guide |
| **[prompts/meta-ads-ad-copy.md](prompts/meta-ads-ad-copy.md)** | Ad copywriting frameworks |
| **[prompts/meta-ads-audience-builder.md](prompts/meta-ads-audience-builder.md)** | Audience targeting strategy |
| **[prompts/meta-ads-creative-analyzer.md](prompts/meta-ads-creative-analyzer.md)** | Creative performance analysis |

---

## 🎓 Examples

### Example 1: Fetch Last 30 Days Performance

```bash
# Using the fetch script
./scripts/fetch-campaigns.sh 30

# Or direct API call
unbrowse_replay --service meta-ads \
  --endpoint "GET /api/ads/campaigns?fields=id,name,status,insights.date_range('last_30days'){impressions,clicks,spend,ctr,cpc,conversions,roas}"
```

### Example 2: Generate Lead Generation Ads

```bash
./scripts/generate-ad-copy.sh \
  "B2B lead generation software" \
  "marketing directors, sales leads" \
  "request demo" \
  "professional"
```

**Output:**
```
Variation 1: Hook → Problem → Solution → CTA
Variation 2: Question → What they'll get → How easy → CTA
Variation 3: Story → Brand position → Emotional connection → CTA
```

### Example 3: Build Lookalike Audience Strategy

```bash
./scripts/build-audiences.sh "high-value customers: top 20% by LTV, repeat purchasers"
```

**Output:**
```
Tier 1: Customer list (top 20% LTV)
Tier 2: Lookalike 1% from best customers
Tier 3: Lookalike 2% for broader reach
Tier 4: Interest-based expansion
```

---

## 🔑 Tech Stack

- **API Access:** OpenClaw [unbrowse](https://docs.openclaw.ai/tools/unbrowse_capture) system
- **Authentication:** Session-based (cookies captured from browser)
- **Marketing:** AI-powered prompts + frameworks
- **Languages:** Bash, Python, JSON processing with jq

---

## 🤝 Credits

This toolkit combines the best of both worlds:

- **🔧 Technical:** [OpenClaw](https://docs.openclaw.ai) unbrowse system for API reverse-engineering
- **📈 Marketing:** [labofideas/ads-skills](https://github.com/labofideas/ads-skills) frameworks

Built with ❤️ for marketers and developers who love automation.

---

## 📄 License

MIT License — feel free to use in your projects!

---

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=zaharenok/meta-ads-api-skill&type=Date)](https://star-history.com/#zaharenok/meta-ads-api-skill&Date)

---

<div align="center">

**[GitHub Repository](https://github.com/zaharenok/meta-ads-api-skill)** •
**[Report Issue](https://github.com/zaharenok/meta-ads-api-skill/issues)** •
**[OpenClaw Docs](https://docs.openclaw.ai)**

Made with ❤️ by [@zaharenok](https://github.com/zaharenok)

</div>
