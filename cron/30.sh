#!/bin/bash


SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh

source $PRED_PATH/var.sh
let dice=$((RANDOM % 100))


source $PRED_PATH/audio.sh
source $PRED_PATH/plist.sh
source $PRED_PATH/schemes.sh


check_state "30"


vol=150



exec_state scheme_1 "3001"



exec_state scheme_2 "3002"




