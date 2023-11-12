function commit-configs --wraps='git add .config/ && git commit -m "configs update "(date)' --description 'alias commit-configs=git add .config/ && git commit -m "configs update "(date)'
  git add .config/ && git commit -m "configs update "(date) $argv; 
end
