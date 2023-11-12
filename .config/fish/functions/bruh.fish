function bruh --wraps='doas systemctl start openvpn-client@bruhvpn-denzy.service' --description 'alias bruh=doas systemctl start openvpn-client@bruhvpn-denzy.service'
  doas systemctl start openvpn-client@bruhvpn-denzy.service $argv
        
end
