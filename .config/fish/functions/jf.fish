function jf --wraps=d --wraps='doas systemctl start jellyfin' --description 'alias jf=doas systemctl start jellyfin'
  doas systemctl start jellyfin $argv
        
end
