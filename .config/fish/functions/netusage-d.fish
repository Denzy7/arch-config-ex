function netusage-d --wraps='vnstati -d -L -ru -o - | feh -' --description 'alias netusage-d=vnstati -d -L -ru -o - | feh -'
  vnstati -d -L -ru -o - | feh - $argv; 
end
