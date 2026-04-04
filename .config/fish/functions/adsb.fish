function adsb --wraps='doas systemctl start readsb nginx tar1090' --description 'alias adsb=doas systemctl start readsb nginx tar1090'
    doas systemctl start readsb nginx tar1090 $argv
end
