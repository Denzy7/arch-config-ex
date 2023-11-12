function ccat --wraps='pygemtize -g' --wraps='pygementize -g' --wraps='pygmentize -g' --wraps='pygmentize -g -O style=colorful,linenos=1' --wraps='highlight -O ansi' --wraps='highlight -l -O ansi' --description 'alias ccat=highlight -O ansi'
  highlight -O ansi $argv; 
end
