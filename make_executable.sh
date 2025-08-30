#!/bin/bash

# Make all sync scripts executable
chmod +x sync_with_github.sh
chmod +x check_before_sync.sh
chmod +x sync_status.sh

echo "✅ All sync scripts are now executable"
echo ""
echo "Available commands:"
echo "  ./sync_status.sh      - Check current sync status"
echo "  ./check_before_sync.sh - Pre-sync validation"
echo "  ./sync_with_github.sh  - Perform full sync"
