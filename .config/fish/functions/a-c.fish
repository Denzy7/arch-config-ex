function a-c --wraps='=adb tcpip 5555 && adb connect Android.local' --wraps='adb tcpip 5555 && adb connect Android.local' --description 'alias a-c=adb tcpip 5555 && adb connect Android.local'
  adb tcpip 5555 && adb connect Android.local $argv
        
end
