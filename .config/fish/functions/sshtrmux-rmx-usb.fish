function sshtrmux-rmx-usb --wraps=ssh\ u0_a203@\(adb\ shell\ ip\ -4\ addr\ show\ usb0\ \|\ grep\ -oP\ \'\(\?\<=inet\\s\)\\d+\(\\.\\d+\)\{3\}\'\)\ -p\ 8022\ -i\ /home/denzy/pkdroid-rmx --description alias\ sshtrmux-rmx-usb=ssh\ u0_a203@\(adb\ shell\ ip\ -4\ addr\ show\ usb0\ \|\ grep\ -oP\ \'\(\?\<=inet\\s\)\\d+\(\\.\\d+\)\{3\}\'\)\ -p\ 8022\ -i\ /home/denzy/pkdroid-rmx
  ssh u0_a203@(adb shell ip -4 addr show usb0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}') -p 8022 -i /home/denzy/pkdroid-rmx $argv
        
end
