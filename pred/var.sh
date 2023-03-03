#!/bin/bash

let state=$(cat $CONFIG_PATH/state.txt)
let STATE=$state
let S1=$(cat $CONFIG_PATH/s1.txt)
let S2=$(cat $CONFIG_PATH/s2.txt)
let S3=$(cat $CONFIG_PATH/s3.txt)
S_L=()
S_L+=("$STATE")
S_L+=("$S1")
S_L+=("$S2")
S_L+=("$S3")





