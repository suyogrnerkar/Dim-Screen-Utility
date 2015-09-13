#!/bin/bash

# Script to dim laptop screen to a level lower that the one permitted by the 
# regular dim screen program by debian distro.
# Can be used in two ways -
#  1. With command line argument for the value to dim to
#  2. Listing the availabe range of dimming options.
# 

if [ "$1" == "-h" ]; then
  echo "Usage: -
    `basename $0`                 => NO argument gives a range of values
    `basename $0` [dim value]     => Expects actual dim value to set"
  exit 0
else
  if [ $1 ]; then
    if [ $1 -ge 80 -a $1 -le 4500 ]; then
      echo '":L' | sudo -S su -c "echo "$1" >/sys/class/backlight/intel_backlight/brightness"
      printf "\nSUCCESS: Dim Screen Level Set to: $1 \n\n"
    else
      printf "\nERROR: Value to set must be within range : 80-4500 \n\n"
    fi
  else
    printf "**************************************************************\n"
    printf "      Dim the screen beyond the lowest dim screen level       \n"
    printf "**************************************************************\n"
    printf "\nPlease select preferred value to dim the screen. \n\n"
    printf "  Enter option number of your choice: \n\n"

    ITERATION=1
    STR="Set dim level value to - "
    DIM_VALUES=(80 100 120 140 160 180 200 240 280 340 380 400 440 480 520 580
      640 680 740 790 850 1200 1500 1800 2000 2500 3000 3500 4000 4500)
    DV_LENGTH=${#DIM_VALUES[@]}

    for VAR in ${DIM_VALUES[@]}; do
      printf "    %02d] $STR $VAR \n" $ITERATION
      ITERATION=$((ITERATION+1))
    done

    printf "\n" && printf "Enter your choice: " && read INPUT_OPTION

    if [ "$INPUT_OPTION" -ge 1 -a "$INPUT_OPTION" -le $DV_LENGTH ]; then
      printf "\nSUCCESS: Setting Screen Dim level as per choice entered: %02d \n\n" $INPUT_OPTION
      dim=${DIM_VALUES[INPUT_OPTION-1]}

      if [ -n "${dim-unset}" ]; then
        echo '":L' | sudo -S su -c "echo "$dim" >/sys/class/backlight/intel_backlight/brightness"
      fi
    else
      echo "ERROR: Not a valid option !"
    fi
  fi
fi

