#!/bin/bash

# P_DIR=$(pwd | xargs dirname)
# source $P_DIR/pred/paths.sh

SCRIPT_PATH=$HOME/1/bash/

# git -C $SCRIPT_PATH add . && git -C $SCRIPT_PATH commit -a -m "mila update" &&  git -C $SCRIPT_PATH push


git -C $SCRIPT_PATH fetch && git -C $SCRIPT_PATH reset --hard origin/master
