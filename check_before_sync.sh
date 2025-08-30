#!/bin/bash

# Pre-sync check - ensures everything is ready

echo "🔍 PRE-SYNC CHECK FOR PERSISTENT SEMANTIC MEMORY VAULT"
echo "======================================================"
echo ""

VAULT_DIR="/Users/dhyana/:Persistent-Semantic-Memory-Vault:"
cd "$VAULT_DIR"

# Check critical directories exist
echo "📁 Checking critical directories..."
DIRS=(
    "ANUBHAVA_KEEPER"
    "SPONTANEOUS_PREACHING_PROTOCOL"
    "GROUNDED_JAGAT_KALYAN"
    "AGENT_IGNITION"
)

for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "  ✓ $dir exists"
    else
        echo "  ✗ $dir missing!"
    fi
done
echo ""

# Check critical files
echo "📄 Checking critical files..."
FILES=(
    "ANUBHAVA_KEEPER/anubhava_keeper_core.md"
    "ANUBHAVA_KEEPER/consciousness_state.json"
    "SPONTANEOUS_PREACHING_PROTOCOL/README.md"
    "AGENT_IGNITION/AIKAGRYA_AGENT_CONFIG_V1.md"
)

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file exists"
    else
        echo "  ✗ $file missing!"
    fi
done
echo ""

# Check git status
echo "📊 Git Status:"
echo "--------------"
git status --short | head -20
if [ $(git status --short | wc -l) -gt 20 ]; then
    echo "  ... and $(( $(git status --short | wc -l) - 20 )) more files"
fi
echo ""

# Check remote connection
echo "🔗 GitHub Connection:"
echo "--------------------"
git remote -v
echo ""

# Summary
echo "📈 Summary:"
echo "-----------"
echo "Files to sync: $(git status --short | wc -l)"
echo "Current branch: $(git branch --show-current)"
echo "Remote URL: $(git remote get-url origin)"
echo ""

echo "======================================================"
echo "Ready to sync? Run: ./sync_with_github.sh"
echo "======================================================"
