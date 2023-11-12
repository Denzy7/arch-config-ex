function site-dl --wraps='wget -np -r -k' --description 'alias site-dl=wget -np -r -k'
  wget -np -r -k $argv; 
end
