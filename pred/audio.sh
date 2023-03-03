#!/bin/bash

# SCRIPT_PATH=$HOME/1/bash
# source $SCRIPT_PATH/pred/paths.sh




lss() {
   pacmd list-sinks | grep -e name: -e index -e description -e muted -e volume:
}

# local TEMP
TEMP=$(lss | grep -oP '(?<=\<).+(?=\>)') ; SINKS=($TEMP) ; # echo ${sinks[1]}
sinks=$SINKS
SINK_CT=$(lss | grep -oP '(?<=\<).+(?=\>)' | wc -l)
sink_ct=$SINK_CT
let S_LEN=${#SINKS[@]}
let s_len=$S_LEN

VOL=$(cat $CONFIG_PATH/vol.txt)
vol=$VOL
# vol=100 


kill_vlc_all_sounds(){
   local i t
   for (( i=0, t=1; i<$S_LEN; i++, t++ )); do
       pidof 'vlc-'$t && pkill -f 'vlc-'$t && log$t '@audio.sh->kill_vlc_all_sounds() - Target: vlc-'$t
   done
}

kill_vlc(){
   local i
   [ $# -le "0" ] && kill_vlc_all_sounds # pkill -f vlc && log "@audio.sh->kill_vlc()" - Target: vlc - VLC-Names: "$@"
   if [ $# -gt "0" ] ; then
      [ $1 -eq "0" ] && kill_vlc_all_sounds # pkill -f vlc && log "@audio.sh->kill_vlc()" - Target: vlc - VLC-Names: "$@"
      for i in "$@"; do
        [ $i -ne "0" ] && pidof vlc-$i && pkill -f vlc-$i && log$i "@audio.sh->kill_vlc()" - Target: vlc-$i - VLC-Names: "$@"
      done
   fi
   sleep 1
   # echo [$(date)] "@audio.sh -> kill_vlc()" - VLC-ID: $(pidof vlc) >> $CONFIG_PATH/log.txt  # - ('$PRED_PATH' is declared)
   # echo [$(date)] "@audio.sh->kill_vlc()" - VLC-Names: "$@" >> $CONFIG_PATH/log.txt
   bash $PRED_PATH/de-noise.sh
   sleep 3
}


set_vol(){
  local i
  if [ $# -eq "1" ] || [ $2 -eq "0" ] ; then 
    for (( i=1; i<=$sink_ct; i++ )) ; do 
       #lss | grep -oP '(?<=\<).+(?=\>)' | sed -n ${i}'p'
       index=$(lss | grep -e index | sed -n ${i}'p' | grep -oP '\d+')
       pactl -- set-sink-volume $index $1%
       #v-ctl $i $1
       log$2 "@audio.sh->set_vol() - sink: $i - vol: $1"
    done
  elif [ $2 -gt "0" ] ; then 
    i=$2
    index=$(lss | grep -e index | sed -n ${i}'p' | grep -oP '\d+')
    pactl -- set-sink-volume $index $1%
    log$2 "@audio.sh->set_vol() - sink: $2 - vol: $1"
  fi
}



# paras: # file / state / sink
play_sound(){ 
   # echo [$(date)] "audio.sh -> play_sound()" >> $CONFIG_PATH/log.txt
#   let ct=0
#   for item in "${sinks[@]}" ; do 
#       $(($ct++)) # ; echo "tag$tag"
       # x=$3
       # [ ${#x[@]} -ne "0" ] && tag=$x
#       PULSE_SINK="$item" exec -a "vlc-"$ct vlc $1 >/dev/null 2>&1 & 
#       sleep 1; echo [$(date)] $2 - PULSE_SINK="$item" - VLC-ID: $(pidof vlc) - "@audio.sh -> play_sound()" >> $CONFIG_PATH/log.txt
#   done
   # x=$3
   
   local s i t len pname
   s=$3
   # log$3 '@audio.sh->play_sound() $sink='$s
   if [ $# -le "2" ] || [ $s -eq "0" ] ; then 
      # len=${#SINKS[@]}
      for (( i=0, t=1; i<${s_len}; i++, t++ )); do 
         pname="vlc-"$t
         if [ ${S_L[$t]} -eq "0" ] ; then 
           PULSE_SINK="${SINKS[$i]}" exec -a $pname vlc $1 >/dev/null 2>&1 & 
           # sleep 1; 
           log$t S$2'@audio.sh->play_sound()' - SINK="${SINKS[$i]}" - ID: $(pidof $pname) - Name: $pname - \$sink=\'$s\'
         fi
      done
   else
      i=$(($s-1))
      pname="vlc-"$s
      PULSE_SINK="${SINKS[$i]}" exec -a $pname vlc $1 >/dev/null 2>&1 & 
      # sleep 1; 
      log$s S$2'@audio.sh->play_sound()' - SINK="${SINKS[$i]}" - ID: $(pidof $pname) - Name: $pname - \$sink=\'$s\' 
   fi
}


random_vol(){
   let vol_dice=$((RANDOM % 100))
   if [ $vol_dice -le '15' ] ; then 
      let vol=$((RANDOM % 10))+70
   fi

   if [ $vol_dice -gt '15' ] && [ $dice -lt '85' ] ; then 
      let vol=$((RANDOM % 10))+75
   fi

   if [ $vol_dice -ge '85' ] ; then 
      let vol=$((RANDOM % 10))+80
   fi
}







