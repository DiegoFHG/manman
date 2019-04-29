answer=
usage="$(basename $0) [OPTION...] TOPIC... 

  Visualize man pages in a more visual way.

    -h  Show this help text.
"

while getopts "h" opt; do
  case $opt in
    h)
      echo "$usage"
      exit 1
      ;;
    \?)
      exit 1
      ;;
  esac
done

if [ "$1" != "" ]; then
    if man "$1" > /dev/null 2>&1
    then
        answer=$1
    else
        echo -e "\e[91m✗ \e[39mTopic not found."
        exit 1
    fi
else
    answer=$(man -k . | rofi -dmenu | awk '{print $1}')
fi

if [ $answer != null ]; then
    { man -Tpdf $answer | zathura --log-level=error - & } 1>/dev/null 2>&1
else
    echo -e "\e[91m✗ \e[39mTopic not selected."
    exit 1
fi
