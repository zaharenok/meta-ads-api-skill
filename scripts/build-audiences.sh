#!/bin/bash
# Generate Meta Ads audience targeting recommendations
# Usage: ./build-audiences.sh "ideal_customer_description"

set -e

CUSTOMER_DESC="$1"

if [ -z "$CUSTOMER_DESC" ]; then
  echo "❌ Error: Missing customer description"
  echo ""
  echo "Usage: $0 '<customer_description>'"
  echo ""
  echo "Example:"
  echo "  $0 'busy professionals 25-45 in cities, want to lose 5-20kg, tried diets before, need accountability'"
  exit 1
fi

echo "🎯 Building Meta Ads audiences..."
echo "👤 Ideal Customer: $CUSTOMER_DESC"
echo ""

# Create prompt file
PROMPT_FILE="/tmp/audience-prompt-$(date +%s).txt"

cat > "$PROMPT_FILE" <<EOF
You are a Meta Ads audience strategist. Build a comprehensive audience strategy for:

**Ideal Customer:** $CUSTOMER_DESC

Provide recommendations in this format:

## Tier 1: First-Party Data (Highest Quality)
1. **Customer List Audiences**
   - Email subscribers (all)
   - Past purchasers (90 days)
   - High-value customers (top 20% by LTV)
   - Lapsed customers (90-180 days)

2. **Website Audiences**
   - All visitors (30/60/180 days)
   - Product page viewers
   - Add to cart, didn't purchase
   - Blog readers

3. **Engagement Audiences**
   - Facebook page visitors (30 days)
   - Instagram profile visitors
   - Video viewers (25%/50%/95%)
   - Lead form openers

## Tier 2: Lookalike Audiences
Based on best customer segments from Tier 1:
- LAL from purchasers (1%)
- LAL from high-value customers (1%)
- LAL from website purchasers (1%)

## Tier 3: Interest-Based Targeting
**Interests:**
[List 10-15 relevant interests based on customer description]

**Demographics:**
- Age range: [recommend]
- Locations: [recommend]
- Languages: [recommend]

**Behaviors:**
[Behaviors related to their purchase intent]

## Tier 4: Exclusions
Exclude these audiences to avoid waste:
- Past purchasers (for acquisition)
- Engaged but never purchased (if low quality)
- Competitors' employees

**Estimated Audience Sizes:**
[Mark each tier with expected audience size]

**Testing Priority:**
Rank these tiers by ROAS potential and testing order.
EOF

echo "🤖 Generating audience strategy..."
echo ""
echo "--- Audience Strategy Prompt ---"
echo ""
cat "$PROMPT_FILE"
echo ""
echo "---"
echo ""
echo "✅ Prompt file saved to: $PROMPT_FILE"
echo ""
echo "Next: Send this prompt to get detailed audience recommendations"
