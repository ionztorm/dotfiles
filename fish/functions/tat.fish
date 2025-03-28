function tat --wraps='tmux attach -t' --description 'alias tat=tmux attach -t'
  tmux attach -t $argv
        
end
