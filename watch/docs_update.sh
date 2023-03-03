#!/bin/bash

# P_DIR=$(pwd | xargs dirname)
# source $P_DIR/pred/paths.sh

SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh

# CONFIG_PATH=$HOME/Documents
# SCRIPT_PATH=$HOME/1/bash
# PRED_PATH=$SCRIPT_PATH/pred

git -C $LOG_PATH add . && git -C $LOG_PATH commit -a -m "Server Update" &&  git -C $LOG_PATH push --force

git -C $CONFIG_PATH add . && git -C $CONFIG_PATH commit -a -m "Server Update" &&  git -C $CONFIG_PATH push

git -C $CONFIG_PATH fetch && git -C $CONFIG_PATH reset --hard origin/master
# git -C $CONFIG_PATH pull

bash $PRED_PATH/load_state.sh

git -C $CONFIG_PATH add . && git -C $CONFIG_PATH commit -a -m "Server Update" &&  git -C $CONFIG_PATH push
