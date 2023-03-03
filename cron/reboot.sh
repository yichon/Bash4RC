#!/bin/bash

#P_DIR=$(pwd | xargs dirname)
#source $P_DIR/pred/paths.sh

SCRIPT_PATH=$HOME/1/bash
WATCH_PATH=$SCRIPT_PATH/watch
# P_DIR=$HOME/1/bash
# source $P_DIR/pred/paths.sh


# nohup watch -n 8 $WATCH_PATH/scripts_update.sh >/dev/null 2>&1 &
# nohup watch -n 4 $WATCH_PATH/docs_update.sh >/dev/null 2>&1 &



# pidof watch | xargs kill

sleep 30
echo "execute from $WATCH_PATH"
xfce4-terminal -e "watch -n 16 $WATCH_PATH/scripts_update.sh"
xfce4-terminal -e "watch -n 8 $WATCH_PATH/docs_update.sh"

