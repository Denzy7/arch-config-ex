function commit-home --wraps='git add . && git commit "configs update "(date)' --wraps='git add . && git commit -m "configs update "(date)' --wraps='git add . && git commit -m "home update "(date)' --description 'alias commit-home=git add . && git commit -m "home update "(date)'
  git add . && git commit -m "home update "(date) $argv; 
end
