# Dotfiles

## Contents

- [I use ... btw](#i-use--btw)
- [Install Brew](#install-brew)
- [Clone the Files](#clone-the-files)
- [Configuring Zsh](#configuring-zsh)
  - [Adding Aliases for Homebrew](#adding-aliases-for-homebrew)
- [Installing Software with Brewfile](#installing-software-with-brewfile)
  - [What is a Brewfile?](#what-is-a-brewfile)
- [Switching to Fish Shell (After Installation)](#switching-to-fish-shell-after-installation)
  - [Use Fish Temporarily (via .zshrc)](#use-fish-temporarily-via-zshrc)
  - [Make Fish Your Default Shell](#make-fish-your-default-shell)
- [Building Helix & Yazi From Source](#building-helix-and-yazi-from-source)
  - [Install Rust](#install-rust)
  - [Clone Repositories](#clone-repositories)
  - [Building Helix](#building-helix)
  - [Building Yazi](#building-yazi)

---

## I use ... btw

I use:

- [Ghostty Terminal](https://github.com/ghostty/ghostty)
- [Fish Shell](https://github.com/fish-shell/fish-shell)
- [Helix Editor](https://github.com/helix-editor/helix)
- [Tmux Terminal Multiplexer](https://github.com/tmux/tmux)
- [Yazi File Explorer](https://github.com/sxyazi/yazi)
- [Lazygit](https://github.com/jesseduffield/lazygit) for git
- [Homebrew Package Manager](https://brew.sh/)

Everything is themed with `Kanagawa`.

---

## Install Brew

You can [get Homebrew here](https://brew.sh/) for MacOS and Linux.

The dotfiles come with a `Brewfile` to make package installation simple.

---

## Clone the Files

### Warning: Potential Data Loss

If you already have a `~/.config` directory, the following steps will **completely delete it**. This means you will lose all existing configuration files stored in `~/.config`. **Ensure you have a backup before proceeding.**

### Steps

1. Backup your existing `.config` directory:

```bash
mv ~/.config ~/.config_backup
```

2. Delete the original `.config` directory:

```bash
rm -rf ~/.config
```

3. Clone the dotfiles repository:

```bash
git clone https://github.com/ionztorm/dotfiles.git ~/.config
```

---

## Configuring Zsh

### Adding Aliases for Homebrew

Open your `.zshrc` file:

```bash
vi ~/.zshrc
```

Add these aliases to simplify Brewfile management:

```bash
alias bfi="brew bundle --file=~/.config/homebrew/Brewfile"
alias bfc="brew bundle dump --file=~/.config/homebrew/Brewfile"
```

Save and exit: Press `esc` and type `:wq`.

Apply changes with:

```bash
source ~/.zshrc
```

---

## Installing Software with Brewfile

### What is a Brewfile?

A `Brewfile` is a convenient way to define and manage a list of Homebrew packages you want installed. It acts as a package list that Homebrew reads to automatically install, upgrade, or clean up software.

### Installation Command

Run the following command to install all software listed in your `Brewfile`:

```bash
bfi
```

If you don't want to build Helix and Yazi from source, install the latest stable releases with:

```bash
brew install helix yazi
```

---

## Switching to Fish Shell (After Installation)

### Use Fish Temporarily (via `.zshrc`)

Add this line to your `.zshrc` file to load Fish whenever you open a terminal session:

```bash
echo 'exec fish' >> ~/.zshrc
```

### Make Fish Your Default Shell

To set Fish as your default shell permanently:

```bash
chsh -s $(which fish)
```

If Fish is not listed in your `/etc/shells`, add it manually:

```bash
echo $(which fish) | sudo tee -a /etc/shells
```

To switch back to Zsh:

```bash
chsh -s $(which zsh)
```

---

## Building Helix & Yazi From Source

### Install Rust

Install Rust:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Verify installation:

```bash
cargo --version
```

### Clone Repositories

Create source directory and clone the repositories:

```bash
mkdir -p ~/src/ ~/.local/bin
cd ~/src
```

Clone Helix and Yazi:

```bash
git clone https://github.com/helix-editor/helix
git clone https://github.com/sxyazi/yazi.git
```

### Building Helix

Build and install Helix:

```bash
cd ~/src/helix
cargo install --path helix-term --locked
```

Symlink the runtime:

```bash
rm -rf ~/.config/helix/runtime && ln -s "$PWD/runtime" ~/.config/helix/runtime
```

### Building Yazi

Build Yazi:

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
