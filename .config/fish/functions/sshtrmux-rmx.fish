function sshtrmux-rmx --wraps=ssh\ u0_a203@\(adb\ shell\ ip\ -4\ addr\ show\ wlan0\ \|\ grep\ -oP\ \'\(\?\<=inet\\s\)\\d+\(\\.\\d+\)\{3\}\'\)\ -p\ 8022\ -i\ pkdroid-rmx --wraps=ssh\ u0_a205@\(adb\ shell\ ip\ -4\ addr\ show\ wlan0\ \|\ grep\ -oP\ \'\(\?\<=inet\\s\)\\d+\(\\.\\d+\)\{3\}\'\)\ -p\ 8022\ -i\ \~/.ssh/id_rsa --description alias\ sshtrmux-rmx=ssh\ u0_a205@\(adb\ shell\ ip\ -4\ addr\ show\ wlan0\ \|\ grep\ -oP\ \'\(\?\<=inet\\s\)\\d+\(\\.\\d+\)\{3\}\'\)\ -p\ 8022\ -i\ \~/.ssh/id_rsa
  ssh u0_a205@(adb shell ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}') -p 8022 -i ~/.ssh/id_rsa $argv
        
end
