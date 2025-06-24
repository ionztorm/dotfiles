if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x XDG_CONFIG_HOME $HOME/.config
    set -g fish_greeting
    zoxide init fish | source
end
