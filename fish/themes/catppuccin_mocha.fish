# Catppuccin Mocha Theme for Fish Shell
# Styled after Kanagawa structure

# Base colors
set -g foreground CDD6F4
set -g selection 313244
set -g comment 6C7086
set -g red F38BA8
set -g orange FAB387
set -g yellow F9E2AF
set -g green A6E3A1
set -g purple CBA6F7
set -g cyan 94E2D5
set -g pink F5C2E7
set -g blue 89B4FA

# Syntax Highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment
set -g fish_color_match $foreground
set -g fish_color_host_remote $red

# Pager
set -g fish_pager_color_selected_background --background=$selection
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
