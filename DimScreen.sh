NEWLINE=$'\n'
echo "${NEWLINE}"

echo "******************************************************************"
echo "        Dim the screen beyond the lowest dim screen level"
echo "******************************************************************"

echo "${NEWLINE}"

str="Set dim level value to "
echo "Please select preferred value to dim the screen. "
echo "  Enter option number of your choice: "
echo "    [  1 ] $str 80."
echo "    [  2 ] $str 100."
echo "    [  3 ] $str 120."
echo "    [  4 ] $str 140."
echo "    [  5 ] $str 160."
echo "    [  6 ] $str 180."
echo "    [  7 ] $str 200."
echo "    [  8 ] $str 240."
echo "    [  9 ] $str 280."
echo "    [ 10 ] $str 340."
echo "    [ 11 ] $str 380."
echo "    [ 12 ] $str 400."
echo "    [ 13 ] $str 440."
echo "    [ 14 ] $str 480."
echo "    [ 15 ] $str 520."

echo "${NEWLINE}"
echo "Enter your choice:"
read input_opt

if (("$input_opt" > 0 && "$input_opt" < 16)); then
    echo "Setting Screen Dim level as per choice entered: $input_opt"
    
    case "$input_opt" in

    1) dim=80
       ;;
    2) dim=100
       ;;
    3) dim=120
       ;;
    4) dim=140
       ;;
    5) dim=160
       ;;
    6) dim=180
       ;;
    7) dim=200
       ;;
    8) dim=240
       ;;
    9) dim=280
       ;;
    10) dim=340
       ;;
    11) dim=380
       ;;
    12) dim=400
       ;;
    13) dim=440
       ;;
    14) dim=480
       ;;
    15) dim=520
       ;;   
    *) echo "Option number not processed"
       ;;
    esac
    
    if [ -n "${dim-unset}" ]; then
        echo '":L' | sudo -S su -c "echo "$dim" >/sys/class/backlight/intel_backlight/brightness"
    fi
else
    echo "Not a valid option !"
fi

