#!/bin/bash

INSTALL_PATH=${HOME}
INSTALL_USER=${USER}

function f_Install(){
    echo "install to "${INSTALL_PATH}", for user "${INSTALL_USER}
    install -v -o ${INSTALL_USER} -m640 .emacs ${INSTALL_PATH}/.emacs
    echo "copy .emacs.d"
    cp -r .emacs.d ${INSTALL_PATH}/
    echo "copy fonts"
    cp -r font-victor-mono ${INSTALL_PATH}/.fonts/
    echo "done."
}

case $1 in
    install)
	f_Install
	;;

esac
