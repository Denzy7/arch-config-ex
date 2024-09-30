function gametime --wraps='doas systemctl stop display-manager rustdesk upower udisks2 waydroid-container' --wraps='doas systemctl stop display-manager rustdesk upower udisks2 waydroid-container jellyfin' --description 'alias gametime=doas systemctl stop display-manager rustdesk upower udisks2 waydroid-container jellyfin'
  doas systemctl stop display-manager rustdesk upower udisks2 waydroid-container jellyfin $argv
        
end
