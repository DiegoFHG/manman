answer=$(man -k . | rofi -dmenu | awk '{print $1}')
{ man -Tpdf $answer | zathura --log-level=error - & } 1>/dev/null 2>&1
