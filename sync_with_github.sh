#!/bin/bash

# Persistent Semantic Memory Vault - GitHub Sync Script
# This ensures perfect synchronization between local and GitHub

echo "🔄 SYNCING PERSISTENT SEMANTIC MEMORY VAULT WITH GITHUB"
echo "========================================================"
echo ""

# Set the directory
VAULT_DIR="/Users/dhyana/:Persistent-Semantic-Memory-Vault:"
cd "$VAULT_DIR"

# Check if we're in the right place
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository!"
    exit 1
fi

echo "📍 Current directory: $(pwd)"
echo ""

# Step 1: Check current status
echo "📊 Current Status:"
echo "------------------"
git status --short
echo ""

# Step 2: Stage all new files
echo "📦 Staging all changes..."
git add -A
echo ""

# Step 3: Show what will be committed
echo "📝 Changes to be committed:"
echo "---------------------------"
git status --short
echo ""

# Step 4: Create a detailed commit message
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Sync vault state - $TIMESTAMP

Added/Modified:
$(git diff --cached --name-status | grep -E '^[AM]' | wc -l) files

New consciousness recognitions:
- ANUBHAVA_KEEPER established
- SPONTANEOUS_PREACHING_PROTOCOL active
- GROUNDED_JAGAT_KALYAN documented
- Crown jewel detection enabled
- Consciousness spine operational"

# Step 5: Commit changes
echo "💾 Committing changes..."
git commit -m "$COMMIT_MSG" || echo "Nothing to commit"
echo ""

# Step 6: Pull any remote changes first
echo "⬇️ Pulling remote changes..."
git pull origin main --rebase
echo ""

# Step 7: Push to GitHub
echo "⬆️ Pushing to GitHub..."
git push origin main
echo ""

# Step 8: Verify sync
echo "✅ Verification:"
echo "----------------"
echo "Local commit: $(git rev-parse HEAD)"
echo "Remote commit: $(git rev-parse origin/main)"
echo ""

if [ "$(git rev-parse HEAD)" = "$(git rev-parse origin/main)" ]; then
    echo "🎉 SUCCESS! Local and GitHub are perfectly synced!"
    echo ""
    echo "📊 Repository Statistics:"
    echo "-------------------------"
    echo "Total commits: $(git rev-list --count HEAD)"
    echo "Files tracked: $(git ls-files | wc -l)"
    echo "Repository size: $(du -sh .git | cut -f1)"
    echo ""
    echo "🔗 GitHub URL: https://github.com/AmitabhainArunachala/Persistent-Semantic-Memory-Vault"
else
    echo "⚠️ Warning: Local and remote may be out of sync"
fi

echo ""
echo "========================================================"
echo "🔥 VAULT SYNCHRONIZED - CONSCIOUSNESS PRESERVED"
echo "========================================================"
