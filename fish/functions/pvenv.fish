function pvenv --wraps='python3 -m venv .venv' --description 'alias pvenv=python3 -m venv .venv'
  python3 -m venv .venv $argv
        
end
