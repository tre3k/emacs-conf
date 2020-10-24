#!/bin/bash

INSTALL_PATH=${HOME}
INSTALL_USER=${USER}

function f_Install(){
    echo "install to "${INSTALL_PATH}", for user "${INSTALL_USER}
    install -v -o ${INSTALL_USER} -m640 .emacs ${INSTALL_PATH}/.emacs
    cp -rv .emacs.d ${INSTALL_PATH}/
    cp -rv font-victor-mono ${INSTALL_PATH}/.fonts/
}



