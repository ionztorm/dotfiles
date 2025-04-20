# Ashen Color Palette Variables
set -g background 121212
set -g red_flame C53030 # Bright red (e.g., strong errors)
set -g red_glowing DF6464 # Softer glowing red (e.g., quotes)
set -g red_ember B14242 # Ember red (e.g., keywords, user, cancel)
set -g orange_glow D97B4A # Highlighted orange (e.g., options)
set -g orange_blaze C4693E # Command tone (commands, operators)
set -g orange_smolder E49A44 # Redirections, punctuation
set -g orange_golden E6A62B # Possible for cwd
set -g brown 88492B # Autosuggestions, background tones
set -g dark_brown 312119 # Selection background
set -g text B4B4B4 # General foreground
set -g g_1 E5E5E5
set -g g_2 D5D5D5 # Parameters, escape
set -g g_3 B4B4B4 # Duplicate of text (fine)
set -g g_4 A7A7A7 # Pager descriptions
set -g g_5 949494
set -g g_6 737373 # Comments, gray
set -g g_7 535353
set -g blue 4A8B8B # Used for git:(branch) wrapper

# Prompt
set -g prompt_error $red_flame # For ➜ arrow on error, and git branch
set -g prompt_success $orange_glow # For ➜ arrow on success
set -g prompt_accent $red_glowing # For Python virtualenv icon and dirty ✗
set -g prompt_info $red_ember # For cwd and git arrows (↑↓)
set -g prompt_git_wrapper $blue # For git:(branch) wrapper

# Syntax Highlighting
set -g fish_color_normal $text
set -g fish_color_command $orange_blaze -o
set -g fish_color_param $g_2
set -g fish_color_keyword $red_ember -o
set -g fish_color_quote $red_glowing
set -g fish_color_redirection $orange_smolder
set -g fish_color_end $orange_smolder
set -g fish_color_comment $g_6 -i
set -g fish_color_error $red_flame
set -g fish_color_gray $g_6
set -g fish_color_selection --background=$dark_brown
set -g fish_color_search_match $background --background=$dark_brown
set -g fish_color_option $orange_glow
set -g fish_color_operator $orange_blaze
set -g fish_color_escape $g_2
set -g fish_color_autosuggestion $brown
set -g fish_color_cancel $red_ember
set -g fish_color_cwd $orange_golden
set -g fish_color_user $red_ember
set -g fish_color_host $orange_blaze
set -g fish_color_host_remote $orange_blaze
set -g fish_color_status $orange_glow

# Pager
set -g fish_pager_color_progress $orange_glow
set -g fish_pager_color_prefix $orange_glow
set -g fish_pager_color_completion $text
set -g fish_pager_color_description $g_4
set -g fish_pager_color_selected_background --background=$dark_brown
