# remap prefix to Control + a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

# reduce keystroke latency
set -s escape-time 1

# center window list
set -g status-justify centre

# visual notification
setw -g monitor-activity on
set -g visual-activity on
