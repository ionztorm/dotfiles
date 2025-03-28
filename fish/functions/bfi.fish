function bfi --wraps='brew bundle --file=~/.config/homebrew/Brewfile' --description 'alias bfi=brew bundle --file=~/.config/homebrew/Brewfile'
  brew bundle --file=~/.config/homebrew/Brewfile $argv
        
end
