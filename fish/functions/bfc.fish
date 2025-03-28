function bfc --wraps='brew bundle dump --file=~/.config/homebrew/Brewfile' --description 'alias bfc=brew bundle dump --file=~/.config/homebrew/Brewfile'
  brew bundle dump --file=~/.config/homebrew/Brewfile $argv
        
end
