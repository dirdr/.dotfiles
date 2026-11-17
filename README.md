# MacOS dotfiles

`~/.config` is this repository on every machine. A whitelist `.gitignore` tracks only the entries below; everything else in `~/.config` stays local.

## Structure

- aerospace : window manager
- ghostty : terminal
- nvim : code editor
- tmux : terminal multiplexer (install tpm with `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`)
- starship.toml : shell prompt
- .zshrc : shell config, linked with `ln -sfn ~/.config/.zshrc ~/.zshrc`

Machine-specific shell config goes in `~/.zshrc.local` (untracked).

## Sync

Run `dotfiles-sync` on any machine: it commits local changes, rebases on the remote, then pushes.

To track a new config directory, add `!/<name>/` to `.gitignore`.

## New machine

```sh
cd ~/.config
git init -b main
git remote add origin git@github.com:dirdr/.dotfiles.git
git fetch origin
git checkout -f -t origin/main
ln -sfn ~/.config/.zshrc ~/.zshrc
```
