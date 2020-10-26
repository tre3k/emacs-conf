#!/usr/bin/env bash

PACKAGES_GIT_URL="a b c"
PACKAGES_LOCAL_URL=""


CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function f_init(){
    echo "Init..."
    for far in ${PACKAGES_GIT_URL}
    do
	
    done
   
}

function f_update(){
    echo "Update..."
}

case $1 in
    init)
	f_init
	;;
    update)
	f_update
	;;
    
esac
