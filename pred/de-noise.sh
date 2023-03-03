#!/bin/bash


C_DIR=$(dirname "$0")
source $C_DIR/paths.sh

source $C_DIR/var.sh
# let state=$(cat $CONFIG_PATH/state.txt)



lss() {
   pacmd list-sinks | grep -e name: -e index -e description -e muted -e volume:
}

# local TEMP
TEMP=$(lss | grep -oP '(?<=\<).+(?=\>)') ; SINKS=($TEMP) ; 
SINKS_CT=$(lss | grep -oP '(?<=\<).+(?=\>)' | wc -l)
let S_LEN=${#SINKS[@]}

play_sound() {
   # echo [$(date)] "de-noise.sh -> play_sound()" >> $CONFIG_PATH/log.txt 
   local item i t s pname
#   for item in "${sinks[@]}" ; do 
#       PULSE_SINK="$item" exec -a "vlc-denoi" vlc $1 >/dev/null 2>&1 & 
#       echo [$(date)] $2 - PULSE_SINK="$item" - VLC-ID: $(pidof vlc-denoi) >> $CONFIG_PATH/log.txt
#   done
   # log '$#='$#, '$3'=$3
   if [ $# -le "2" ] || [ $3 -eq "0" ] ; then 
      # log 'then'
      for (( i=0, t=1; i<$S_LEN; i++, t++ )); do
          pname="vlc-denoi-"$t
          PULSE_SINK="${SINKS[$i]}" exec -a $pname vlc $1 >/dev/null 2>&1 & 
          log $2 - SINK="${SINKS[$i]}" - ID: $(pidof $pname) - Name: $pname # >> $CONFIG_PATH/log.txt
      done
   else
      # log 'else'
      s=$3
      i=$(($s-1))
      pname="vlc-denoi-"$s
      PULSE_SINK="${SINKS[$i]}" exec -a $pname vlc $1 >/dev/null 2>&1 & 
      log $2 - SINK="${SINKS[$i]}" - ID: $(pidof $pname) - Name: $pname # >> $CONFIG_PATH/log.txt
   fi
   # log 'de-noise start...S'$state >> $CONFIG_PATH/log.txt
}


de_noise() {
   [ $STATE -eq "-5" ] && exit
   local silence i t
   silence="$SOUNDS_PATH/__silence/silence.mp3 --repeat"
   # ! pidof vlc-denoi && play_sound "$silence" "@de_noise.sh -> play_sound()" 
   # log 'de-noise'
   for (( i=0, t=1; i<$S_LEN; i++, t++ )); do
       ! pidof 'vlc-denoi-'$t && play_sound "$silence" "@de_noise.sh->play_sound()" "$t"
       x=($(pidof 'vlc-denoi-'$t)) 
       if [ ${#x[@]} -gt "1" ] ; then 
         kill ${x[0]} # get rid of redundant vlc-denoi-*
         log 'vlc-denoi-'$t' - '${x[0]}' closed - '${x[@]} 
       fi
   done
}


de_noise

