# Setup

## .zshrc setup

Access zshrc or create if it does not exist:

```zsh
nvim ~/.zshrc
```

Paste:

```
alias nv="nvim"
alias cl="clear"

eval "$(starship init zsh)"
```

## clone repo

```zsh
git clone git@github.com:ionztorm/dotfiles.git
```

## install tmux package manager and catppuccin theme

### tmux

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

### catppuccin

```zsh
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.1 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```
