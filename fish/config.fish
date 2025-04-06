if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    # source ~/.config/fish/themes/dark-plus.fish
    # source ~/.config/fish/themes/kanagawa.fish
    source ~/.config/fish/themes/catppuccin_mocha.fish
    zoxide init fish | source
end
