#!/bin/bash


SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh

source $PRED_PATH/var.sh
let dice=$((RANDOM % 100))
let vol_dice=$((RANDOM % 100))

source $PRED_PATH/audio.sh
source $PRED_PATH/plist.sh
source $PRED_PATH/schemes.sh


log vlc: $(ps -ef | grep -oP "vlc[^\s]*-\d") - num of sinks: $S_LEN


# check_state "5"


exec_state scheme_1 "501"





