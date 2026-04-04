function adsb-stop --wraps='doas systemctl start tar1090 readsb' --wraps='doas systemctl stop tar1090 readsb' --description 'alias adsb-stop=doas systemctl stop tar1090 readsb'
    doas systemctl stop tar1090 readsb $argv
end
