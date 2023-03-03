#!/bin/bash

WHO=Server
# CONFIG_PATH=$HOME/Documents
# PRED_PATH=/home/mila/1/bash/pred

C_DIR=$(dirname "$0")
source $C_DIR/paths.sh

source $PRED_PATH/git_ops.sh "$CONFIG_PATH"


c_state=$(cat $CONFIG_PATH/c_state.txt)
c_s1=$(cat $CONFIG_PATH/c_s1.txt)
c_s2=$(cat $CONFIG_PATH/c_s2.txt)
c_s3=$(cat $CONFIG_PATH/c_s3.txt)


if [ $c_state -ne "10" ] ; then
   state=$(cat $CONFIG_PATH/state.txt)
   echo $c_state > $CONFIG_PATH/state.txt && log "S$c_state - Change state to ($c_state) from ($state)"
   echo "10" > $CONFIG_PATH/c_state.txt && commit_and_push
fi



if [ $c_s1 -ne "10" ] ; then
   s1=$(cat $CONFIG_PATH/s1.txt)
   echo $c_s1 > $CONFIG_PATH/s1.txt && log "S$c_s1 - Change s1 to ($c_s1) from ($s1)"
   echo "10" > $CONFIG_PATH/c_s1.txt && commit_and_push
fi



if [ $c_s2 -ne "10" ] ; then
   s2=$(cat $CONFIG_PATH/s2.txt)
   echo $c_s2 > $CONFIG_PATH/s2.txt && log "S$c_s2 - Change s2 to ($c_s2) from ($s2)"
   echo "10" > $CONFIG_PATH/c_s2.txt && commit_and_push
fi



if [ $c_s3 -ne "10" ] ; then
   s3=$(cat $CONFIG_PATH/s3.txt)
   echo $c_s3 > $CONFIG_PATH/s3.txt && log "S$c_s3 - Change s3 to ($c_s3) from ($s3)"
   echo "10" > $CONFIG_PATH/c_s3.txt && commit_and_push
fi


cl=$(cat $CONFIG_PATH/clear_log.txt)
if [ $cl -eq "1" ] ; then 
  n=$(wc -l < $LOG_PATH/log.txt)
  [ $n -gt "0" ] && echo [$(date)] "Log Cleared: $n lines" > $LOG_PATH/log.txt

  n=$(wc -l < $LOG_PATH/log1.txt)
  [ $n -gt "0" ] && echo [$(date)] "Log Cleared: $n lines" > $LOG_PATH/log1.txt 

  n=$(wc -l < $LOG_PATH/log2.txt)
  [ $n -gt "0" ] && echo [$(date)] "Log Cleared: $n lines" > $LOG_PATH/log2.txt 

  n=$(wc -l < $LOG_PATH/log3.txt)
  [ $n -gt "0" ] && echo [$(date)] "Log Cleared: $n lines" > $LOG_PATH/log3.txt 
  
  echo "0" > $CONFIG_PATH/clear_log.txt && commit_and_push
fi


# print_

