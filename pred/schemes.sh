#!/bin/bash


# C_DIR=$(dirname "$0")
# source $C_DIR/paths.sh

# source $C_DIR/plist.sh


SCRIPT_PATH=$HOME/1/bash
source $SCRIPT_PATH/pred/paths.sh
source $PRED_PATH/plist.sh





# t=$(date '+%H%M'); [ $t -gt '1200' ] && echo "afternoon"
get_time(){
  date '+%H%M' 
}


get_random(){
    local d
    d=$((RANDOM % 100))
    s=$(($1-1))
    # echo s=$s d=$d
    if [ $# -gt "0" ] ; then 
      [ $d -le '60' ] && shuf -i 0-$s -n 1
      [ $d -gt '60' ] && echo $((RANDOM % $1))
    else
      shuf -i 1-100 -n 1 
    fi
}


get_random2(){
  shuf -i $1-$2 -n 1 
}


sleep_lt(){
  local x
  # x=$((RANDOM % $1))
  x=$(get_random $1)
  log "@$2 - sleep ($x seconds)..."  
  sleep $x
}



check_state(){
   local i t sh is_selected
   is_selected=0
   for (( i=0, t=1; i<=$s_len; i++, t++ )); do 
     sh=$(echo ${S_L[$i]} | grep -oP "^$1")
     if [ ${#sh} -ne "0" ] ; then 
        is_selected=1
     fi
   done
   
   if [ $is_selected -eq "1" ] ; then 
     sleep_lt "600" "$1" 
     # x=$((RANDOM % 400))
     # log "@$1.sh - sleep ($x seconds)..."  
     # sleep $x
   else
     exit
   fi
}



# paras: scheme / state
exec_state(){
     local i t s
     s=$2
     for (( i=0, t=1; i<=$s_len; i++, t++ )); do 
        if [ ${S_L[$i]} -eq "$s" ] ; then 
           set_vol "$vol" "$i"
           kill_vlc "$i"
           
           # log "$@ S1503 $i"
           # "$@" "S$s" "$i"
           "$@" "$i"
           
           
           [ $i -ne "0" ] && log$i "S$s" - vol: $vol% - ID: $(pidof 'vlc-'$i) - 'Name: vlc-'$i - "@schemes->exec_state()"
           [ $i -eq "0" ] && log$i "S$s" - vol: $vol% - 'Index: '$i 
           
           # sleep_lt "10" "$2 - sink: $i"
        elif [ ${S_L[$i]} -eq "0" ] && [ $STATE -le '1' ] ; then
           kill_vlc "$i"
        fi
    done
}





# paras: state / sink
scheme_1(){
  play_sound "$song_1" "$1" "$2"
  log$2  "@schemes->scheme_1()"
}



# paras: state / sink
scheme_2(){
  play_sound "$song_2" "$1" "$2"
  log$2  "@schemes->scheme_2()"
}











