function !bruh --wraps='doas systemctl stop openvpn-client@bruhvpn-denzy.service' --description 'alias !bruh=doas systemctl stop openvpn-client@bruhvpn-denzy.service'
  doas systemctl stop openvpn-client@bruhvpn-denzy.service $argv
        
end
