# Catppuccin Mocha

# === General ===
set -g status on
set -g status-interval 5
set -g status-justify left
set -g status-bg "#1E1E2E"                   # base
set -g status-fg "#CDD6F4"                   # text
set -g status-style "fg=#CDD6F4,bg=#1E1E2E"
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm-256color:Tc'

# === Window Titles ===
set -g window-status-format ' #[fg=#6C7086] #W '        # overlay0
set -g window-status-current-format '#[bg=#FAB387,fg=#1E1E2E,nobold]#[fg=#1E1E2E,bg=#FAB387,bold]  #W #[fg=#FAB387,bg=#1E1E2E,nobold]'
set -g window-status-separator ""
set -g window-status-current-style "fg=#CBA6F7,bold"     # mauve
set -g window-status-style "fg=#6C7086"                  # overlay0

# === Pane Borders ===
set -g pane-border-style "fg=#45475A"                    # surface1
set -g pane-active-border-style "fg=#89B4FA"             # blue

# === Messages ===
set -g message-style "fg=#CDD6F4,bg=#313244"             # text on surface0
set -g message-command-style "fg=#89B4FA,bg=#313244"     # blue on surface0

# === Copy Mode ===
# set -g mode-style "fg=#89B4FA,bg=#313244"

# === Clock ===
# set -g clock-mode-style "fg=#89B4FA,bg=#1E1E2E"

# === Left Status ===
set -g status-left-length 40
set -g status-left '#[fg=#1E1E2E,bg=#89B4FA,bold] 󰈸 #S #[fg=#89B4FA,bg=#1E1E2E,nobold]'

# === Right Status ===
set -g status-right-length 150
set -g status-right '#[fg=#F38BA8]#(cd "#{pane_current_path}" && git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo " $(git rev-parse --abbrev-ref HEAD)") #[fg=#FAB387,bg=#1E1E2E,nobold]#[fg=#1E1E2E,bg=#FAB387,bold]  %d/%m #[fg=#1E1E2E,bg=#FAB387,nobold]#[fg=#89B4FA,bg=#1E1E2E,nobold]#[fg=#1E1E2E,bg=#89B4FA,bold]  %H:%M '

# === Palette Reference ===
# base        = "#1E1E2E"
# text        = "#CDD6F4"
# blue        = "#89B4FA"
# mauve       = "#CBA6F7"
# peach       = "#FAB387"
# red         = "#F38BA8"
# overlay0    = "#6C7086"
# surface0    = "#313244"
# surface1    = "#45475A"
