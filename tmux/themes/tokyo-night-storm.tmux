# Tokyo Night Storm

# === General ===
set -g status on
set -g status-interval 5
set -g status-justify left
set -g status-bg "#24283B"                   # bg
set -g status-fg "#c0caf5"                   # fg
set -g status-style "fg=#c0caf5,bg=#1a1b26"
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm-256color:Tc'

# === Window Titles ===
set -g window-status-format ' #[fg=#545c7e] #W '        # comment/dim
set -g window-status-current-format '#[bg=#bb9af7,fg=#1a1b26,nobold]#[fg=#1a1b26,bg=#bb9af7,bold]  #W #[fg=#bb9af7,bg=#1a1b26,nobold]'
set -g window-status-separator ""
set -g window-status-current-style "fg=#bb9af7,bold"     # purple
set -g window-status-style "fg=#545c7e"                  # comment

# === Pane Borders ===
set -g pane-border-style "fg=#3b4261"                    # border
set -g pane-active-border-style "fg=#2ac3de"             # blue

# === Messages ===
set -g message-style "fg=#c0caf5,bg=#292e42"             # fg on darker bg
set -g message-command-style "fg=#2ac3de,bg=#292e42"     # blue on bg_dark

# === Copy Mode ===
# set -g mode-style "fg=#2ac3de,bg=#292e42"

# === Clock ===
# set -g clock-mode-style "fg=#2ac3de,bg=#1a1b26"

# === Left Status ===
set -g status-left-length 40
set -g status-left '#[fg=#1a1b26,bg=#2ac3de,bold] 󰈸 #S #[fg=#2ac3de,bg=#1a1b26,nobold]'

# === Right Status ===
set -g status-right-length 150
set -g status-right '#[fg=#f7768e]#(cd "#{pane_current_path}" && git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo " $(git rev-parse --abbrev-ref HEAD)") #[fg=#bb9af7,bg=#1a1b26,nobold]#[fg=#1a1b26,bg=#bb9af7,bold]  %d/%m #[fg=#1a1b26,bg=#bb9af7,nobold]#[fg=#2ac3de,bg=#1a1b26,nobold]#[fg=#1a1b26,bg=#2ac3de,bold]  %H:%M '

# === Palette Reference (Tokyo Night Storm) ===
# bg           = "#1a1b26"
# bg_dark      = "#292e42"
# fg           = "#c0caf5"
# blue         = "#2ac3de"
# purple       = "#bb9af7"
# yellow       = "#bb9af7"
# red          = "#f7768e"
# border       = "#3b4261"
# comment      = "#545c7e"
# teal         = "#2ac3de"
