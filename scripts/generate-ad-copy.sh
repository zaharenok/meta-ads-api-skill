#!/bin/bash
# Generate Meta Ads ad copy using AI
# Usage: ./generate-ad-copy.sh "product" "audience" "goal" [brand_voice]

set -e

PRODUCT="$1"
AUDIENCE="$2"
GOAL="$3"
BRAND_VOICE="${4:-professional}"

if [ -z "$PRODUCT" ] || [ -z "$AUDIENCE" ] || [ -z "$GOAL" ]; then
  echo "❌ Error: Missing required parameters"
  echo ""
  echo "Usage: $0 <product> <audience> <goal> [brand_voice]"
  echo ""
  echo "Example:"
  echo "  $0 'fitness app' 'busy professionals 25-45' 'get them to try free trial' 'friendly'"
  exit 1
fi

echo "📝 Generating Meta Ads copy..."
echo "📦 Product: $PRODUCT"
echo "👥 Audience: $AUDIENCE"
echo "🎯 Goal: $GOAL"
echo "🎤 Brand Voice: $BRAND_VOICE"
echo ""

# Create prompt file
PROMPT_FILE="/tmp/ad-copy-prompt-$(date +%s).txt"

cat > "$PROMPT_FILE" <<EOF
You are a Meta Ads copywriter. Generate 3 variations of Facebook/Instagram ad primary text using this framework:

**Product:** $PRODUCT
**Target Audience:** $AUDIENCE
**Goal:** $GOAL
**Brand Voice:** $BRAND_VOICE

**Format:**
Variation 1: [Hook] + [Problem] + [Solution] + [CTA]
Variation 2: [Question] + [What they'll get] + [How easy] + [CTA]
Variation 3: [Story] + [Emotional connection] + [CTA]

**Requirements:**
- Keep under 125 characters for link clicks
- Use emojis sparingly (max 2 per ad)
- Match brand voice: $BRAND_VOICE
- Include clear CTA
- No generic marketing fluff

Generate the 3 variations now.
EOF

# Call OpenClaw to generate (placeholder - user can replace with their preferred AI)
echo "🤖 Calling AI to generate ad copy..."
echo ""
echo "--- Generated Variations ---"
echo ""
echo "💡 Copy this prompt and send to me:"
echo ""
cat "$PROMPT_FILE"
echo ""
echo "---"
echo ""
echo "✅ Prompt file saved to: $PROMPT_FILE"
echo ""
echo "Next: Send the prompt above to get AI-generated ad copy variations"
