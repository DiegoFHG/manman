answer=

if [ "$1" != "" ]; then
    answer=$1
else
    answer=$(man -k . | rofi -dmenu | awk '{print $1}')
fi

if [ "$answer" ]; then
    { man -Tpdf $answer | zathura --log-level=error - & } 1>/dev/null 2>&1
else
    echo -e "\e[91m✗ \e[39mTopic not selected. Exiting."
    exit 1
fi
