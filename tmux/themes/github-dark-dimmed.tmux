# GitHub Dark Dimmed — Clean & Functional Tmux Theme

# === General ===
set -g status on
set -g status-interval 5
set -g status-justify left
set -g status-bg "#22272e"
set -g status-fg "#adbac7"
set -g status-style fg=#adbac7
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ',xterm-256color:Tc'

# === Window Titles ===
set -g window-status-format " #[fg=#768390] #W "
set -g window-status-current-format '#[bg=#986ee2,fg=#22272e,nobold]#[fg=#22272e,bg=#986ee2,bold]  #W #[fg=#986ee2,bg=#22272e,nobold]'

set -g window-status-separator ""
set -g window-status-current-style fg=#986ee2,bold
set -g window-status-style fg=#768390

# === Pane Borders ===
set -g pane-border-style fg=#444c56
set -g pane-active-border-style fg=#6cb6ff

# === Messages ===
set -g message-style fg=#adbac7,bg=#2d333b
set -g message-command-style fg=#6cb6ff,bg=#2d333b

# === Copy Mode ===
set -g mode-style fg=#6cb6ff,bg=#444c56

# === Clock ===
set -g clock-mode-style fg=#6cb6ff,bg=#22272e

# === Left Status ===
# Show session name inside a blue box with flame icon
set -g status-left-length 40
set -g status-left '#[fg=#22272e,bg=#6cb6ff,bold] 󰈸 #S #[fg=#6cb6ff,bg=#22272e,nobold]'

# === Right Status ===
# Show Git branch if inside a repo
set -g status-right-length 150
set -g status-right '#[fg=#e5534b]#(cd "#{pane_current_path}" && git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo " $(git rev-parse --abbrev-ref HEAD)") #[fg=#986ee2,bg=#22272e,nobold]#[fg=#22272e,bg=#986ee2,bold]  %d/%m #[fg=#22272e,bg=#986ee2,nobold]#[fg=#6cb6ff,bg=#22272e,nobold]#[fg=#22272e,bg=#6cb6ff,bold]  %H:%M #[fg=#22272e,bg=#2]'


# 986ee2 - purple
# 6cb6ff - blue
