function ccpy --wraps='xclip -selection clipboard' --description 'alias ccpy=xclip -selection clipboard'
  xclip -selection clipboard $argv; 
end
