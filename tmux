set -g default-terminal "screen-256color"

set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'christoomey/vim-tmux-navigator'

set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

unbind %
bind | split-window -h 

unbind '"'
bind - split-window -v

unbind r
bind r source-file ~/.tmux.conf

# to unset time delay for nvim
set -g escape-time 10
set -sg escape-time 10

bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5

run '~/.tmux/plugins/tpm/tpm'
