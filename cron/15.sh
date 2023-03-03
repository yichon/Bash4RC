#!/bin/bash




SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh


# let state=$(cat $CONFIG_PATH/state.txt)
source $PRED_PATH/var.sh
# echo $state


let dice=$((RANDOM % 100))


source $PRED_PATH/audio.sh


source $PRED_PATH/schemes.sh






if [ $STATE -eq '0' ] ; then 
   pidof vlc && pkill -f vlc && echo [$(date)] S0 - "Shut down..." >> $LOG_PATH/log.txt
fi



check_state "15"



# x=$((RANDOM % 300))
# log @15.sh - "sleep ($x seconds)..."  
# sleep $x



if [ $STATE -eq '1501' ] ; then 


fi



# let len=${#sinks[@]}
for (( i=0, t=1; i<${s_len}; i++, t++ )); do 
  if [ ${S_L[$t]} -eq "1501" ] ; then 

  elif [ ${S_L[$t]} -eq "0" ] && [ $STATE -le '1' ] ; then

  fi
done





if [ $STATE -eq '1502' ] ; then 

fi





exec_state scheme_1 "1503"




exec_1504(){
   exec_state "$@" "1504"
}
exec_1504 scheme__1




