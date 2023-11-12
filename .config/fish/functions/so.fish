function so --wraps='doas swapoff /swapfile' --description 'alias so=doas swapoff /swapfile'
  doas swapoff /swapfile $argv
        
end
