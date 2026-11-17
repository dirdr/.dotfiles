#!/bin/sh
# Two-way sync of ~/.config dotfiles with GitHub
set -e

DIR="$HOME/.config"
cd "$DIR"

git pull --rebase --autostash >/dev/null 2>&1 || true
git add -A

if ! git diff --cached --quiet; then
    git commit -m "dotfiles sync $(date '+%Y-%m-%d %H:%M') @ $(hostname -s)"
    git push
    echo "✅ dotfiles synced & pushed"
else
    git push >/dev/null 2>&1 || true
    echo "✅ dotfiles up to date (nothing to commit)"
fi
