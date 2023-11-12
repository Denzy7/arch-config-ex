function hb --wraps='doas swapon /swapfile && systemctl hibernate' --description 'alias hb=doas swapon /swapfile && systemctl hibernate'
  doas swapon /swapfile && systemctl hibernate $argv
        
end
