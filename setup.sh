#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Add here you custom packages
PACKAGES_GIT_URL=(
    "https://github.com/dimitri/el-get"
    "https://github.com/auto-complete/fuzzy-el"
)
PACKAGES_LOCAL_URL=(
    ${CURR_DIR}/el-get
    ${CURR_DIR}/packages/fuzzy-el
)



function f_init(){
    echo "Init..."

    # generate packages.el file
    echo "(defun packages()" > ${CURR_DIR}/packages/packages.el
    echo "  (interactive)" >> ${CURR_DIR}/packages/packages.el
    echo "  '(" >> ${CURR_DIR}/packages/packages.el

    
    mkdir -p ${CURR_DIR}/packages
    index=0
    for url in ${PACKAGES_GIT_URL[*]}
    do
	git clone ${url} ${PACKAGES_LOCAL_URL[$index]}
	echo "   \"${PACKAGES_LOCAL_URL[$index]}\"" >> ${CURR_DIR}/packages/packages.el
	index=$(($index+1))
    done

    echo "   )" >> ${CURR_DIR}/packages/packages.el
    echo "  )" >> ${CURR_DIR}/packages/packages.el
    echo "(provide 'packages)" >> ${CURR_DIR}/packages/packages.el
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
