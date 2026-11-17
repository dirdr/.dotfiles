function dotfiles-sync --description "Two-way sync of ~/.config dotfiles with GitHub"
    set -l dir ~/.config
    git -C $dir pull --rebase --autostash 2>/dev/null
    git -C $dir add -A
    if not git -C $dir diff --cached --quiet
        git -C $dir commit -m "dotfiles sync "(date "+%Y-%m-%d %H:%M")" @ "(hostname -s)
        and git -C $dir push
        and echo "✅ dotfiles synced & pushed"
    else
        git -C $dir push 2>/dev/null
        echo "✅ dotfiles up to date (nothing to commit)"
    end
end
