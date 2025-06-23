# Ayu Mirage — Clean & Functional Tmux Theme (Corrected)

# === General ===
set -g status on
set -g status-interval 5
set -g status-justify left
set -g status-bg "#1f2430"
set -g status-fg "#cccac2"
set -g status-style "fg=#cccac2,bg=#1f2430"
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm-256color:Tc'

# === Window Titles ===
set -g window-status-format ' #[fg=#565b66] #W '
set -g window-status-current-format '#[bg=#ffad66,fg=#1f2430,nobold]#[fg=#1f2430,bg=#ffad66,bold]  #W #[fg=#ffad66,bg=#1f2430,nobold]'
set -g window-status-separator ""
set -g window-status-current-style "fg=#dfbfff,bold"
set -g window-status-style "fg=#565b66"

# === Pane Borders ===
set -g pane-border-style "fg=#444b55"
set -g pane-active-border-style "fg=#73d0ff"

# === Messages ===
set -g message-style "fg=#cccac2,bg=#323843"
set -g message-command-style "fg=#73d0ff,bg=#323843"

# === Copy Mode ===
# set -g mode-style "fg=#73d0ff,bg=#323843"

# === Clock ===
# set -g clock-mode-style "fg=#73d0ff,bg=#1f2430"

# === Left Status ===
set -g status-left-length 40
set -g status-left '#[fg=#1f2430,bg=#73d0ff,bold] 󰈸 #S #[fg=#73d0ff,bg=#1f2430,nobold]'

# === Right Status ===
set -g status-right-length 150
set -g status-right '#[fg=#f28779]#(cd "#{pane_current_path}" && git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo " $(git rev-parse --abbrev-ref HEAD)") #[fg=#ffad66,bg=#1f2430,nobold]#[fg=#1f2430,bg=#ffad66,bold]  %d/%m #[fg=#1f2430,bg=#ffad66,nobold]#[fg=#73d0ff,bg=#1f2430,nobold]#[fg=#1f2430,bg=#73d0ff,bold]  %H:%M '

# === Palette Reference ===
# background = "#1f2430"
# foreground = "#cccac2"
# blue = "#73d0ff"
# magenta = "#dfbfff"
# orange = "#ffad66"
# red = "#f28779"
# gray = "#565b66"
# dark_gray = "#323843"
# cyan = "#444b55"
# green = "#d5ff80"
# yellow = "#ffcc77"
