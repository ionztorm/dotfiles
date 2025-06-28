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
- [Building Helix and Yazi From Source](#building-helix-and-yazi-from-source)
  - [Installing Rust](#installing-rust)
  - [Cloning Repositories](#cloning-repositories)
  - [Building Helix](#building-helix)
- [Additional Tips](#additional-tips)
  - [Updating Brewfile](#updating-brewfile)
  - [Markdown Live Preview](#markdown-live-preview)
  - [Tmux Usage](#tmux-usage)
  - [Zellij Usage](#zellij-usage)

---

## Introduction

I use the following tools to enhance my development workflow:

- **[Ghostty Terminal](https://github.com/ghostty/ghostty)**
- **[Fish Shell](https://github.com/fish-shell/fish-shell)**
- **[Helix Editor](https://github.com/helix-editor/helix)**
- **[Zellij](https://github.com/zellij-org/zellij)**
- **[Yazi File Explorer](https://github.com/sxyazi/yazi)**
- **[Lazygit](https://github.com/jesseduffield/lazygit)** for git management
- **[Homebrew Package Manager](https://brew.sh/)**

> **Note**: Everything is themed with `Ayu Mirage`. The lazygit, zellij, and yazi themes are custom made. I also include a theme for Tmux if you prefer that over Zellij

- **[Tmux Terminal Multiplexer](https://github.com/tmux/tmux)**

---

## Install Homebrew

You can install Homebrew for MacOS and Linux from their [official website](https://brew.sh/).

The dotfiles include a `Brewfile` to simplify package installation.

---

## Cloning Dotfiles

### ⚠️ Warning: Potential Data Loss

If you have an existing `~/.config` directory, the steps below **will completely delete it**. Make sure you back up your configuration files before proceeding.

### Steps

1. **Backup and Remove Existing `.config` Directory:**

```bash
mv ~/.config ~/.config_backup
rm -rf ~/.config
```

2. **Clone the Dotfiles Repository:**

```bash
git clone https://github.com/ionztorm/dotfiles.git ~/.config
```

---

## Configuring Zsh

### Homebrew Aliases

Edit your `.zshrc` file:

```bash
echo 'alias bfi="brew bundle --file=~/.config/homebrew/Brewfile"' >> ~/.zshrc
echo 'alias bfc="brew bundle dump --file=~/.config/homebrew/Brewfile"' >> ~/.zshrc
```

Apply changes with:

```bash
source ~/.zshrc
```

---

## Managing Software with Brewfile

Install all packages from my brewfile:

```bash
bfi
```

I build helix from source, but if you prefer not to, use:

```bash
brew install helix
```

---

## Switching to Fish Shell

### Temporary Switch via `.zshrc`

Add this line to your `.zshrc` to start Fish when opening a terminal:

```bash
echo 'exec fish' >> ~/.zshrc
```

---

## Building Helix

### Installing Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Check installation:

```bash
cargo --version
```

You may need to restart your terminal

### Cloning Repositories

```bash
mkdir -p ~/src/
cd ~/src
```

Clone repository:

```bash
git clone https://github.com/helix-editor/helix
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

---

## Additional Tips

### Updating Brewfile

To delete the current `Brewfile` and generate a new one, I include a fish alias:

```bash
bfr
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

### Zellij Usage

I include a number of fish alias' to make using zellij simpler.

| Alias  | Command         | Description                   |
| ------ | --------------- | ----------------------------- |
| `zj`   | `zellij`        | Base Zellij command           |
| `zjs`  | `zellij -s`     | Start new session             |
| `zja`  | `zellij attach` | Attach to a session           |
| `zjls` | `zellij ls`     | List sessions                 |
| `zjd`  | `zellij d`      | Delete session                |
| `zjda` | `zellij da`     | Delete all sessions           |
| `zjk`  | `zellij k`      | Kill session                  |
| `zjka` | `zellij ka`     | Kill all sessions             |
| `zjh`  | `zellij -h`     | Help                          |
| `zjl`  | `zellij -l`     | List available layouts        |
| `zjn`  | `zellij -n`     | Start new session with layout |
