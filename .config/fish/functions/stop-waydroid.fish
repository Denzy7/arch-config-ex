function stop-waydroid --wraps='doas systemctl stop waydroid_magisk_ota.service waydroid-container.service' --wraps='doas systemctl stop waydroid_magisk_ota.service waydroid-container.service && doas waydroid container stop' --description 'alias stop-waydroid=doas systemctl stop waydroid_magisk_ota.service waydroid-container.service && doas waydroid container stop'
    doas systemctl stop waydroid_magisk_ota.service waydroid-container.service && doas waydroid container stop $argv
end
