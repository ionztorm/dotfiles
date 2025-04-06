# Dark+ Palette Color Variables
set -g foreground D4D4D4 # Normal text
set -g selection 264F78 # Selection bg (blended blue)
set -g comment 808080 # Comments
set -g red F44747 # Errors
set -g orange DCDCAA # Constants / punctuation
set -g yellow DCDCAA # Strings / constants (same as orange in Dark+)
set -g green 6A9955 # Strings
set -g purple C586C0 # Variables / params
set -g cyan 4EC9B0 # Functions / types
set -g pink C586C0 # We'll reuse purple as pink (Dark+ has no true pink)
set -g blue 569CD6 # Keywords / commands

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

# Pager
set -g fish_pager_color_selected_background --background=$selection
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
