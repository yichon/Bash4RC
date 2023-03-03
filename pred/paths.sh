#!/bin/bash

BASE_PATH=$HOME

DOC_PATH=$BASE_PATH/Documents
CONFIG_PATH=$DOC_PATH/config
LOG_PATH=$DOC_PATH/log

SCRIPT_PATH=$BASE_PATH/1/bash
PRED_PATH=$SCRIPT_PATH/pred
CRON_PATH=$SCRIPT_PATH/cron
COM_PATH=$SCRIPT_PATH/com
WATCH_PATH=$SCRIPT_PATH/watch



AUDIO_PATH=$BASE_PATH/Music
SOUNDS_PATH=$BASE_PATH/Music





MERGE_LOG=1

log(){
  echo [$(date '+%Y-%m-%d %H:%M:%S %Z')] "$@" >> $LOG_PATH/log.txt
  
  # tail -f $CONFIG_PATH/log.txt | stdbuf -oL cut -d ' ' -f1 | uniq 
  # $PRED_PATH/log.sh "$@"
}


log0(){
  [ $MERGE_LOG -eq "1" ] && log "$@"
  [ $MERGE_LOG -eq "0" ] && echo [$(date '+%Y-%m-%d %H:%M:%S %Z')] "$@" >> $LOG_PATH/log.txt
}


log1(){
  [ $MERGE_LOG -eq "1" ] && log "$@"
  [ $MERGE_LOG -eq "0" ] && echo [$(date '+%Y-%m-%d %H:%M:%S %Z')] "$@" >> $LOG_PATH/log1.txt
}


log2(){
  [ $MERGE_LOG -eq "1" ] && log "$@"
  [ $MERGE_LOG -eq "0" ] && echo [$(date '+%Y-%m-%d %H:%M:%S %Z')] "$@" >> $LOG_PATH/log2.txt
}


log3(){
  [ $MERGE_LOG -eq "1" ] && log "$@"
  [ $MERGE_LOG -eq "0" ] && echo [$(date '+%Y-%m-%d %H:%M:%S %Z')] "$@" >> $LOG_PATH/log3.txt
}






