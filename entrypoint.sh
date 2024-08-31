#!/bin/bash

FILE=$1

# Open the file with the editor
vim "$FILE"

# Check if there are any changes
if [ -n "$(git status --porcelain)" ]; then
  # Commit changes
  git add "$FILE"
  git commit -m "Auto-save changes to $FILE on $(date)"
  
  # Keep only the last 10 commits
  git tag -d $(git tag | head -n -10) 2>/dev/null || true
fi

# Show the last 10 diffs
echo "Last 10 changes:"
git log -p -n 10 -- "$FILE"
