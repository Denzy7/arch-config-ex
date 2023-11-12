function son --wraps='doas swapon /swapfile' --description 'alias son=doas swapon /swapfile'
  doas swapon /swapfile $argv
        
end
