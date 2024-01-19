#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Add here you custom packages
PACKAGES_GIT_URL=(
    "https://github.com/auto-complete/fuzzy-el"
    "https://github.com/auto-complete/auto-complete"
    "https://github.com/bmag/imenu-list"
    "https://github.com/auto-complete/popup-el"
    "https://github.com/joaotavora/eglot"
    "https://github.com/meqif/docker-compose-mode"
    "https://github.com/mickeynp/ligature.el"
    "https://gitlab.com/protesilaos/pulsar"
    "https://github.com/emacsmirror/bookmark-plus"
)
PACKAGES_LOCAL_URL=(
    ${CURR_DIR}/packages/fuzzy-el
    ${CURR_DIR}/packages/auto-complete
    ${CURR_DIR}/packages/imenu-list
    ${CURR_DIR}/packages/popup-el
    ${CURR_DIR}/packages/eglot
    ${CURR_DIR}/packages/docker-compose-mode
    ${CURR_DIR}/packages/ligature-el
    ${CURR_DIR}/packages/pulsar
    ${CURR_DIR}/packages/bookmark-plus
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
    echo "Install fonts"
    mkdir -p ~/.fonts
    tar -xf ${CURR_DIR}/fonts/font*.tar.xz -C ~/.fonts
    fc-cache -f
    echo "Done."

    echo "for work eglot you need LSP (ccls - for c/c++ or clangd) (pyls - for python)"
    echo "for java: you need build https://github.com/eclipse/eclipse.jdt.ls"
    echo "  and add to CLASSPATH path to target/repository"
}

function install_java_lps(){
    echo "install java LPS..."
    mkdir -p ${CURR_DIR}/LSP
    git clone https://github.com/eclipse/eclipse.jdt.ls ${CURR_DIR}/LSP
    cd ${CURR_DIR}/LSP
    ./mvnw clean verify
    CLASSPATH=${CLASSPATH}:${CURR_DIR}/LSP/org.eclipse.jdt.ls.product/target/repository/
    echo "export CLASSPATH="${CLASSPATH} >> ~/.bash_profile
    export CLASSPATH=${CLASSPATH}
    echo "CLASSPATH+=${CURR_DIR}/LSP/org.eclipse.jdt.ls.product/target/repository/"
    echo "relogin for update user enviroments"
}

function f_update(){
    echo "Update..."
    cd ${CURR_DIR}
    git pull
    for path in ${PACKAGES_LOCAL_URL}
    do
	echo "cd" ${path}
	cd ${path}
	git pull
    done
}

function f_help(){
    echo "$0 <init/update>"
    exit 0
}

if [[ "$#" == 0 ]]
then
    f_help
fi

case $1 in
    init)
	f_init
	;;
    update)
	f_update
	;;
    *)
	f_help
	;;
esac
