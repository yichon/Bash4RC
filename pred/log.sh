#!/bin/bash

C_DIR=$(dirname "$0")
source $C_DIR/paths.sh


echo [$(date '+%Y-%m-%d %H:%M:%S %Z')] "$@" >> $CONFIG_PATH/log.txt

# date '+%H%M'
