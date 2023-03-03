#!/bin/bash



SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh


let state=$(cat $CONFIG_PATH/state.txt)
let ct=$(cat $CONFIG_PATH/ct.txt)
let dice=$((RANDOM % 100))


source $PRED_PATH/audio.sh



#random_vol
# vol=150






if [ $state -eq '0' ] ; then 
   pidof vlc && pkill -f vlc && echo [$(date)] S0 - "Shut down..." >> $CONFIG_PATH/log.txt
fi




if [ $state -eq '1001' ] ; then 

fi




if [ $state -eq '1002' ] ; then 


fi




if [ $state -eq '1003' ] ; then 


fi




if [ $state -eq '1004' ] ; then 


fi



if [ $state -eq '1005' ] ; then 


fi

