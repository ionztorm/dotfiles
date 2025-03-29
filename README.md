# Dotfiles Guide

## Contents

- [Introduction](#introduction)
- [Install Homebrew](#install-homebrew)
- [Cloning Dotfiles](#cloning-dotfiles)
- [Configuring Zsh](#configuring-zsh)
  - [Homebrew Aliases](#homebrew-aliases)
- [Managing Software with Brewfile](#managing-software-with-brewfile)
  - [What is a Brewfile?](#what-is-a-brewfile)
  - [Installing All Packages](#installing-all-packages)
- [Switching to Fish Shell](#switching-to-fish-shell)
  - [Temporary Switch via .zshrc](#temporary-switch-via-zshrc)
  - [Setting Fish as Default Shell](#setting-fish-as-default-shell)
- [Building Helix & Yazi From Source](#building-helix-and-yazi-from-source)
  - [Installing Rust](#installing-rust)
  - [Cloning Repositories](#cloning-repositories)
  - [Building Helix](#building-helix)
  - [Building Yazi](#building-yazi)
- [Additional Tips](#additional-tips)
  - [Updating Brewfile](#updating-brewfile)
  - [Markdown Live Preview](#markdown-live-preview)
  - [Tmux Usage](#tmux-usage)

---

## Introduction

I use the following tools to enhance my development workflow:

- **[Ghostty Terminal](https://github.com/ghostty/ghostty)**
- **[Fish Shell](https://github.com/fish-shell/fish-shell)**
- **[Helix Editor](https://github.com/helix-editor/helix)**
- **[Tmux Terminal Multiplexer](https://github.com/tmux/tmux)**
- **[Yazi File Explorer](https://github.com/sxyazi/yazi)**
- **[Lazygit](https://github.com/jesseduffield/lazygit)** for git management
- **[Homebrew Package Manager](https://brew.sh/)**

Everything is themed with `Kanagawa`.

---

## Install Homebrew

You can install Homebrew for MacOS and Linux from their [official website](https://brew.sh/).

The dotfiles include a `Brewfile` to simplify package installation.

---

## Cloning Dotfiles

### ⚠️ Warning: Potential Data Loss

If you have an existing `~/.config` directory, the steps below **will completely delete it**. Make sure you back up your configuration files before proceeding.

### Steps

1. **Backup Existing `.config` Directory:**

```bash
mv ~/.config ~/.config_backup
```

2. **Delete the Original `.config` Directory:**

```bash
rm -rf ~/.config
```

3. **Clone the Dotfiles Repository:**

```bash
git clone https://github.com/ionztorm/dotfiles.git ~/.config
```

---

## Configuring Zsh

### Homebrew Aliases

Edit your `.zshrc` file:

```bash
vi ~/.zshrc
```

Add these aliases for easier `Brewfile` management:

```bash
alias bfi="brew bundle --file=~/.config/homebrew/Brewfile"
alias bfc="brew bundle dump --file=~/.config/homebrew/Brewfile"
```

Apply changes with:

```bash
source ~/.zshrc
```

---

## Managing Software with Brewfile

### What is a Brewfile?

A `Brewfile` is a simple way to define and manage your Homebrew packages. It allows you to install, upgrade, or clean up software with a single command.

### Installing All Packages

To install all software listed in your `Brewfile`, run:

```bash
bfi
```

If you prefer not to build Helix and Yazi from source, use:

```bash
brew install helix yazi
```

---

## Switching to Fish Shell

### Temporary Switch via `.zshrc`

Add this line to your `.zshrc` to start Fish when opening a terminal:

```bash
echo 'exec fish' >> ~/.zshrc
```

### Setting Fish as Default Shell

To permanently switch to Fish:

```bash
chsh -s $(which fish)
```

If Fish is not in your `/etc/shells`, add it:

```bash
echo $(which fish) | sudo tee -a /etc/shells
```

To revert to Zsh:

```bash
chsh -s $(which zsh)
```

---

## Building Helix & Yazi From Source

### Installing Rust

Install Rust:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Check installation:

```bash
cargo --version
```

### Cloning Repositories

```bash
mkdir -p ~/src/ ~/.local/bin
cd ~/src
```

Clone repositories:

```bash
git clone https://github.com/helix-editor/helix

git clone https://github.com/sxyazi/yazi.git
```

### Building Helix

```bash
cd ~/src/helix
cargo install --path helix-term --locked
```

Symlink runtime:

```bash
rm -rf ~/.config/helix/runtime && ln -s "$PWD/runtime" ~/.config/helix/runtime
```

### Building Yazi

```bash
cd ~/src/yazi
cargo build --release --locked
```

Move binaries:

```bash
sudo mkdir -p /usr/local/bin
sudo mv target/release/yazi target/release/ya /usr/local/bin
```

---

## Additional Tips

### Updating Brewfile

Delete the current `Brewfile` and generate a new one:

```bash
rm ~/.config/homebrew/Brewfile
bfc
```

### Markdown Live Preview

For markdown live preview using GitHub formatting, install the CLI extension:

```bash
gh extension install yusukebe/gh-markdown-preview
```

To use:

```bash
gh markdown-preview <path/file name>
```

### Tmux Usage

Install the Tmux plugin manager:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Basic commands:

- `ctrl + s -> c`: Create new window
- `ctrl + s -> ,`: Rename window
- `ctrl + s -> x`: Close window
- `ctrl + s -> <num>`: Switch between windows
- `ctrl + s -> r`: Reload config

Install plugins with: `ctrl + s -> I`

Reload config with: `ctrl + s -> r`
