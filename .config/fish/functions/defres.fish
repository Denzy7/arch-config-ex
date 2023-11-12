function defres --wraps='xrandr -s 0 && xrandr --dpi  96' --description 'alias defres=xrandr -s 0 && xrandr --dpi  96'
  xrandr -s 0 && xrandr --dpi  96 $argv; 
end
