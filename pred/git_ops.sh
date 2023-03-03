#!/bin/bash

# CONFIG_PATH=$HOME/Documents
CONFIG_PATH=$1

git_pull(){
  if [ $WHO == "Client" ] ; then
     git -C $CONFIG_PATH pull
  else 
     git fetch
     git reset --hard origin/master
  fi
}


git_commit(){
  git -C $CONFIG_PATH add . && git -C $CONFIG_PATH commit -a -m "$WHO Update"   
  # git add . && git commit -a -m "Update" && git push
}


git_push(){
  if [ $WHO == "Client" ] ; then
     git -C $CONFIG_PATH push --force
  else
     git -C $CONFIG_PATH push
  fi
}


commit_and_push(){
  git_commit && git_push
}


log_g(){
  echo [$(date)] "$@" >> $CONFIG_PATH/log.txt && commit_and_push
}


print_(){
  echo $CONFIG_PATH
}
