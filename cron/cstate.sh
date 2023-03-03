#!/bin/bash

# CONFIG_PATH=/home/mila/Documents
# P_DIR=$(dirname "$0" | xargs dirname)

# P_DIR=$(pwd | xargs dirname)
# source $P_DIR/pred/paths.sh

SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh
source $PRED_PATH/audio.sh







cstate(){
  local t_s x sink s
  t_s=$(echo $1 | grep -oP '^\d+')
  x=$(echo $1 | grep -oP '[^\d]+')
  sink="0"
  [ ${#x} -ne "0" ] && sink=$(echo $1 | grep -oP '\d+$')
  [ ${#sink} -eq "0" ] && sink="0"


  if [ ${#x} -eq "0" ] || [ $sink -eq "0" ] ; then 
    let state=$(cat $CONFIG_PATH/state.txt)
    if [ $state -ge '0' ] ; then 
      echo $t_s > $CONFIG_PATH/state.txt && log "Change state to $t_s from $state..." # >> $CONFIG_PATH/log.txt
      kill_vlc
    else
      log '**' "Failed to change state to $1..." # >> $CONFIG_PATH/log.txt
    fi
  elif [ $sink -gt "0" ] ; then 
    s=$(cat $CONFIG_PATH/s$sink.txt)
    echo $t_s > $CONFIG_PATH/s$sink.txt && log "Change s$sink to ($t_s) from ($s)..."
  else
    echo "Illegal Sink ID."
  fi

}


cstate "$@"

