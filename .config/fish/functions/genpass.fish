function genpass --wraps="tr -dc '[:alnum:]' </dev/urandom | head -c16" --wraps="tr -dc '[:alnum:]' </dev/urandom | head -c16 | echo" --wraps='echo S0OP83d7nb4pfxE9' --wraps='LC_ALL=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 15; echo' --wraps='LC_ALL=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 17; echo' --wraps='LC_ALL=C tr -dc A-Za-z0-9 < /dev/urandom | head -c 16; echo' --wraps='LC_ALL=C tr -dc A-Za-z0-9!@#+_. < /dev/urandom | head -c 16; echo' --description 'alias genpass=LC_ALL=C tr -dc A-Za-z0-9!@#+_. < /dev/urandom | head -c 16; echo'
  LC_ALL=C tr -dc A-Za-z0-9!@#+_. < /dev/urandom | head -c 16; echo $argv
        
end
