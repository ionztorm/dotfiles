if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    source ~/.config/fish/themes/kanagawa.fish
    zoxide init fish | source
end
