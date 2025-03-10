# Clone the files, all the files!

Take note, these clone commands will error if your config dir already exists. You should probably backup your own configs

```bash
git clone https://github.com/ionztorm/dotfiles.git ~/.config
git clone https://github.com/ionztorm/sennvim.git ~/.config/nvim
```

Got an error and feeling brave? DISCLAIMER: This is going to delete all your stuff!

```bash
rm -rf ~/.config && git clone https://github.com/ionztorm/dotfiles.git ~/.config
```

# zshrc config

Open up the terminal and run the following command:

```bash
vi ~/.zshrc
```

Paste the following into the file:

```bash
alias cl="clear"
alias ls="lsd"
alias lsa="ls -a"
alias lsl="ls -l"
alias lsla="ls -la"
alias lst="ls --tree"
alias cd="z"

# Brew

alias bfi="brew bundle --file=~/.config/homebrew/Brewfile"
alias bfc="brew bundle dump --file=~/.config/homebrew/Brewfile"

# neovim

alias nv="nvim"

# git

alias gs="git status"
alias gc="git commit -m"
alias ga="git add"
alias gaa="git add ."
alias gp="git push"
alias gpf="git push --force"
alias gpl="git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias gl="git log"
alias gd="git diff"
alias gds="git diff --staged"
alias gr="git remote"
alias grr="git remote -v"
alias grrm="git remote remove"
alias grra="git remote add"
alias grru="git remote update"

# tmux

alias tls="tmux ls"                     # list sessions
alias tns="tmux new -s"                 # new session
alias tks="tmux kill-session -t"        # kill named session
alias tka="tmux kill-server"            # kill all sessions
alias tat="tmux attach -t"              # reattach to named session

# python
alias pvenv="python3 -m venv .venv"
alias pvact="source .venv/bin/activate"

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/robbyrussel.json)"
eval "$(zoxide init zsh)"
export PATH=$PATH:$HOME/go/bin         # Sometimes homebrew doesn't add this to the path
```

- Save and exit:

```text
press `esc` to enter normal mode and type `:wq`.
```

- Source the file to load the changes.

```bash
source ~/.zshrc
```

# Installing stuff

## Helix & Yazi

Note: This is for Mac OS, it may differ for your OS.

1. Install Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Check [the official page](https://www.rust-lang.org/tools/install) for an up to date command.

Check it worked:

```bash
cargo --version
```

2. Restart your terminal.

3. Create some folders

```bash
mkdir -p ~/src/ ~/.local/bin
```

4. Access the src dir and clone the repos:

```bash
cd ~/src
```

```bash
git clone https://github.com/helix-editor/helix
git clone https://github.com/sxyazi/yazi.git
```

### Helix

5. Build Helix

```bash
cd ~/src/helix
cargo install --path helix-term --locked
```

6. Symlink the runtime

```bash
rm -rf ~/.config/helix/runtime && ln -s "$PWD/runtime" ~/.config/helix/runtime
```

### Yazi

7. Build Yazi

```bash
cd ~/src/yazi
cargo build --release --locked
```

8. Move binaries to local bin

```bash
mv target/release/yazi target/release/ya ~/.local/bin
```

9. Add to path

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Homebrew

All packages will be installed using Homebrew and a Brewfile. If you've cloned the repo and copied the zshrc file contents above, then you already have the Brewfile and you already have my command alias' to simplify this process.

Homebrew is a package manager for MacOS and Linux. It's what I use to keep my packages up to date. You can likely use whichever package manager you prefer, but you'll have to double check that the packages exist.

So first you need to install homebrew via your commandline. Check this link to see the most up to date command line for installation:

- [Homebrew](https://brew.sh/)

Pay attention to the installation process - once installed it will ask you to run a few commands to add brew to your path. You may also be asked to enter your password at some point to grant permissions to update the command line tools.

## Packages

Make sure homebrew is installed and up to date:

```bash
brew --version
```

If it's installed, install all the packages by running this command in your terminal:

```bash
bfi
```

This may take a while as it installs all packages.

Note, if you install any additional packages of your own using `brew install` you can update the Brewfile by running:

```bash
bfc
```

The file is in `~/.config/homebrew/Brewfile`, so you'll want to make a copy of this if you ever reset to factory defaults.

## Markdown live preview (Helix users only - this is covered in nvim)

If you are using my neovim config, live preview of html / md files cah be achieved using the keymap: `<leader>ls`.

This is not possible in Helix yet, so we can use a github cli extension:

Install (requires github cli which was installed above):

```bash
gh extension install yusukebe/gh-markdown-preview
```

Now we can run the command:

```bash
gh markdown-preview <path/file name>
```

This loads the markdown file in your browser with github formatting. It uses a live server so updates on save.

### Tmux

Tmux is a `T`erminal `Mu`ltiple`x`er - basically it allows you to create sessions that you can attach to and detach from, but the sessions remain active (as long as the device remains turned on). You can create a session for a particular development project, with servers running, detatch from it and re-attach at a later date to find the server still running and your code editor still active.

Before you get started, you'll want to install the plugin manager:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

- Navigate to a project folder using the terminal

```bash
# for example
cd project/directory
```

- Create a session:

```bash
tns <session-name> # often the project name

# For example: tns my-project
```

Quick keybind reference:

- `ctrl` + `s` -> `c` = create new window
- `ctrl` + `s` -> `,` = rename window
- `ctrl` + `s` -> `x` = close window
- `ctrl` + `s` -> `num` = where num is an index number - to switch between windows.
- `ctrl` + `s` -> `r` = reload config

## Alternatives

You can alternativley use:

- zellij instead of tmux
- starship instead of oh-my-posh
- neovim instead of helix
