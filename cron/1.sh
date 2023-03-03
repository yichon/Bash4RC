#!/bin/bash

# P_DIR=$(dirname "$0" | xargs dirname)
# P_DIR=$(pwd | xargs dirname)
# source $P_DIR/pred/paths.sh

SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh

source $PRED_PATH/var.sh
let dice=$((RANDOM % 100))
let vol_dice=$((RANDOM % 100))


source $PRED_PATH/audio.sh

# source $PRED_PATH/git_ops.sh $CONFIG_PATH



# source $PRED_PATH/plist.sh
source $PRED_PATH/schemes.sh

# let state=$(cat $CONFIG_PATH/state.txt)



if [ $state -ge '-1' ] ; then 
   if [ $state -eq '0' ] ; then 
      pkill -f vlc
      echo '1' > $CONFIG_PATH/state.txt && log S1 - "Change state to 1 from $state..." # >> $CONFIG_PATH/log.txt
   fi
   
   bash $PRED_PATH/de-noise.sh
fi

if [ $state -eq '-5' ] ; then 
   pkill -f vlc
fi



# [ $(date '+%H:%M') == "17:22" ] && echo hello
time_state(){
  [ $(date '+%H:%M') == "$1" ] && $PRED_PATH/cstate.sh "$2" && log "@1.sh->time_state()"
}


time_states(){
  local f_path x line t s
  f_path=$CONFIG_PATH/timed_states.txt
  let x=$(grep -c ^ $f_path)
  for (( c=1; c<=$x; c++ )); do 
    line=$(sed -n ${c}'p' $f_path) 
    t=$(echo $line | grep -oP '^[\d:]{5}')
    s=$(echo $line | grep -oP '[^\s]+$')
    time_state "$t" "$s" 
  done
}

time_states

# if [ $HOME == "/home/mila" ] ; then 
#  time_state "04:00" "1"  
#  time_state "08:59" "1"
# fi























