#!/usr/bin/fish

# Kanagawa Fish shell theme
# A template was taken and modified from Tokyonight:
# https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
set -g foreground DCD7BA normal
set -g selection 2D4F67 brcyan
set -g comment 727169 brblack
set -g red C34043 red
set -g orange FF9E64 brred
set -g yellow C0A36E yellow
set -g green 76946A green
set -g purple 957FB8 magenta
set -g cyan 7AA89F cyan
set -g pink D27E99 brmagenta
set -g blue 7E9CD8 blue

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
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

set -g fish_pager_color_selected_background --background=$selection
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
