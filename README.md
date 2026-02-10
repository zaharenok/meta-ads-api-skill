# Meta Ads API Toolkit

**Complete Meta Ads Manager toolkit:** Technical API access + AI-powered marketing automation for Facebook & Instagram advertising.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Skill-blue)](https://docs.openclaw.ai)

## 🚀 Features

### Technical API Access
- ✅ **Reverse-engineered internal API** — Real Meta Ads Manager endpoints via OpenClaw unbrowse
- ✅ **Campaign statistics** — Impressions, clicks, CTR, CPC, spend, conversions
- ✅ **Account management** — All ad accounts, budgets, billing status
- ✅ **Performance analytics** — Daily/hourly breakdowns, A/B test results
- ✅ **Audience insights** — Demographics, targeting criteria

### AI-Powered Marketing Tools
- ✅ **Ad copy generation** — 3 variations using proven frameworks (direct response, lead gen, brand awareness)
- ✅ **Audience building** — Tiered strategy: First-party → Lookalikes → Interests → Exclusions
- ✅ **Creative analysis** — Performance breakdown by creative elements
- ✅ **Marketing prompts** — Battle-tested frameworks from [labofideas/ads-skills](https://github.com/labofideas/ads-skills)

## 📦 Installation

### Prerequisites
- OpenClaw installed
- Meta Ads Manager account with API access

### Setup

```bash
# Clone this repository
git clone https://github.com/zaharenok/meta-ads-api-skill.git
cd meta-ads-api-skill

# Make scripts executable
chmod +x scripts/*.sh

# Run initial API capture (requires login)
./scripts/capture-meta-ads.sh
```

## 🎯 Quick Start

### 1. Fetch Campaign Statistics

```bash
# Last 7 days performance
./scripts/fetch-campaigns.sh 7

# Direct API call
unbrowse_replay --service meta-ads \
  --endpoint "GET /api/ads/campaigns?fields=insights"
```

### 2. Generate Ad Copy

```bash
./scripts/generate-ad-copy.sh \
  "fitness app" \
  "busy professionals 25-45" \
  "start free trial" \
  "friendly"
```

### 3. Build Audience Strategy

```bash
./scripts/build-audiences.sh \
  "busy professionals 25-45, want to lose 5-20kg"
```

## 📚 Documentation

- **[SKILL.md](SKILL.md)** — Complete documentation for OpenClaw integration
- **[prompts/](prompts/)** — Marketing frameworks and templates
  - `meta-ads-ad-copy.md` — Ad copywriting guide
  - `meta-ads-audience-builder.md` — Audience targeting framework
  - `meta-ads-creative-analyzer.md` — Creative performance analysis

## 🔑 Keywords

Meta Ads, Facebook Ads, Instagram Ads, Meta Ads Manager API, Facebook Ads API, Instagram Ads API, ad performance analytics, campaign statistics, ad automation, marketing automation, AI copywriting, audience targeting, Facebook Marketing, Instagram Marketing, Meta Business Suite, OpenClaw skill, ad tech, marketing tech

## 🤝 Credits

- **Technical API Access:** OpenClaw unbrowse system
- **Marketing Frameworks:** [labofideas/ads-skills](https://github.com/labofideas/ads-skills) by Lab of Ideas

## 📄 License

MIT License — feel free to use in your projects!

---

**Made with ❤️ for marketers and developers who love automation**

[GitHub Repository](https://github.com/zaharenok/meta-ads-api-skill) | [OpenClaw Docs](https://docs.openclaw.ai) | [Report Issue](https://github.com/zaharenok/meta-ads-api-skill/issues)
