function bfr --wraps='cd $HOME/.config/homebrew; rm Brewfile; bfc' --description 'alias bfr cd $HOME/.config/homebrew; rm Brewfile; bfc'
  cd $HOME/.config/homebrew; rm Brewfile; bfc $argv
        
end
