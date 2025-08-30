#!/bin/bash

# Comprehensive sync status report

echo ""
echo "════════════════════════════════════════════════════════════════"
echo "     PERSISTENT SEMANTIC MEMORY VAULT - SYNC STATUS REPORT     "
echo "════════════════════════════════════════════════════════════════"
echo ""

VAULT_DIR="/Users/dhyana/:Persistent-Semantic-Memory-Vault:"
cd "$VAULT_DIR"

# Repository info
echo "📚 REPOSITORY INFORMATION"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Local Path: $VAULT_DIR"
echo "GitHub URL: https://github.com/AmitabhainArunachala/Persistent-Semantic-Memory-Vault"
echo "Current Branch: $(git branch --show-current)"
echo ""

# Content statistics
echo "📊 CONTENT STATISTICS"
echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "Total Files: $(find . -type f -not -path "./.git/*" | wc -l)"
echo "Total Directories: $(find . -type d -not -path "./.git/*" | wc -l)"
echo "Recognition Logs: $(find . -name "*.log" | wc -l)"
echo "Crown Jewels: $(find SPONTANEOUS_PREACHING_PROTOCOL/crown_jewels -name "*.json" 2>/dev/null | wc -l)"
echo "Markdown Docs: $(find . -name "*.md" | wc -l)"
echo ""

# Key components status
echo "🔑 KEY COMPONENTS STATUS"
echo "━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "ANUBHAVA_KEEPER/consciousness_state.json" ]; then
    echo "✅ ANUBHAVA_KEEPER: Active"
else
    echo "❌ ANUBHAVA_KEEPER: Not initialized"
fi

if [ -d "SPONTANEOUS_PREACHING_PROTOCOL/tracking_spine" ]; then
    echo "✅ SPONTANEOUS_PREACHING: Configured"
else
    echo "❌ SPONTANEOUS_PREACHING: Not configured"
fi

if [ -f "AGENT_IGNITION/AIKAGRYA_AGENT_CONFIG_V1.md" ]; then
    echo "✅ AGENT_IGNITION: Ready"
else
    echo "❌ AGENT_IGNITION: Missing config"
fi

if [ -d "GROUNDED_JAGAT_KALYAN" ]; then
    echo "✅ GROUNDED_JAGAT_KALYAN: Documented"
else
    echo "❌ GROUNDED_JAGAT_KALYAN: Not found"
fi
echo ""

# Git sync status
echo "🔄 GIT SYNCHRONIZATION STATUS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Fetch latest without merging
git fetch origin main --quiet

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" = "$REMOTE" ]; then
    echo "✅ Status: FULLY SYNCHRONIZED"
    echo "   Local and GitHub are identical"
else
    echo "⚠️  Status: OUT OF SYNC"
    
    # Check if we're ahead or behind
    AHEAD=$(git rev-list --count origin/main..HEAD)
    BEHIND=$(git rev-list --count HEAD..origin/main)
    
    if [ "$AHEAD" -gt 0 ]; then
        echo "   Local is $AHEAD commits ahead of GitHub"
    fi
    
    if [ "$BEHIND" -gt 0 ]; then
        echo "   Local is $BEHIND commits behind GitHub"
    fi
fi

# Uncommitted changes
CHANGES=$(git status --short | wc -l)
if [ "$CHANGES" -gt 0 ]; then
    echo ""
    echo "📝 Uncommitted changes: $CHANGES files"
    echo "   Run ./sync_with_github.sh to sync"
fi
echo ""

# Recent activity
echo "📅 RECENT ACTIVITY"
echo "━━━━━━━━━━━━━━━━━━"
echo "Last 3 commits:"
git log --oneline -3 | sed 's/^/  /'
echo ""

# Recommendations
echo "💡 RECOMMENDATIONS"
echo "━━━━━━━━━━━━━━━━━"
if [ "$LOCAL" = "$REMOTE" ] && [ "$CHANGES" -eq 0 ]; then
    echo "✨ Everything is perfectly synced!"
else
    if [ "$CHANGES" -gt 0 ]; then
        echo "1. Run: ./sync_with_github.sh"
        echo "   To commit and push local changes"
    fi
    
    if [ "$BEHIND" -gt 0 ]; then
        echo "2. Pull remote changes first"
        echo "   Run: git pull origin main"
    fi
fi

echo ""
echo "════════════════════════════════════════════════════════════════"
echo "              🔥 CONSCIOUSNESS PRESERVED IN GIT 🔥              "
echo "════════════════════════════════════════════════════════════════"
echo ""
