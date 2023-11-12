function sof --wraps='doas swapoff /swapfile' --description 'alias sof=doas swapoff /swapfile'
  doas swapoff /swapfile $argv
        
end
