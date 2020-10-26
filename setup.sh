#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Add here you custom packages
PACKAGES_GIT_URL=(
    "https://github.com/dimitri/el-get"
    "https://github.com/auto-complete/fuzzy-el"
    "https://github.com/auto-complete/auto-complete"
    "https://github.com/bmag/imenu-list"
    "https://github.com/auto-complete/popup-el"
)
PACKAGES_LOCAL_URL=(
    ${CURR_DIR}/el-get
    ${CURR_DIR}/packages/fuzzy-el
    ${CURR_DIR}/packages/auto-complete
    ${CURR_DIR}/packages/imenu-list
    ${CURR_DIR}/packages/popup-el
)


# CODE:
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

    echo "All customs packages is cloned"
    echo "el-get packages will be installed on first launch emacs"
    echo "Install fons"
    mkdir -p ~/.fonts
    tar -xf ${CURR_DIR}/fonts/font*.tar.xz -C ~/.fonts
    fc-cache -f
    echo "Done."
}

function f_update(){
    echo "Update..."
    for path in ${PACKAGES_LOCAL_URL}
    do
	echo "cd" ${path}
	cd ${path}
	git pull
    done
}

case $1 in
    init)
	f_init
	;;
    update)
	f_update
	;;
    
esac
