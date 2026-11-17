#!/bin/sh
set -eu

cd "$HOME/.config"

if [ -d .git/rebase-merge ] || [ -d .git/rebase-apply ]; then
    echo "❌ a rebase is in progress in ~/.config: resolve it, then rerun" >&2
    exit 1
fi

git add -A
if ! git diff --cached --quiet; then
    git commit -q -m "chore(sync): $(date '+%Y-%m-%d %H:%M') @ $(hostname -s)"
    echo "📝 committed local changes"
fi

if ! git pull -q --rebase; then
    echo "❌ conflict while pulling: fix the files, 'git add' them, 'git rebase --continue', then rerun" >&2
    exit 1
fi

if [ -n "$(git log '@{u}..' --oneline)" ]; then
    git push -q
    echo "✅ dotfiles synced & pushed"
else
    echo "✅ dotfiles up to date"
fi
