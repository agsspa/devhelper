#!/usr/bin/env sh

set -e


SETTINGS='
\n
# devopscc helpers\n
export DISPLAY=:0 \n
alias h="vim /mnt/c/Windows/System32/drivers/etc/hosts"\n
alias c="~/.devopscc/commit.sh"\n
alias b="~/.devopscc/bootstrap.sh"\n
alias u="~/.devopscc/up.sh"\n
alias s="~/.devopscc/stop.sh"\n
alias d="~/.devopscc/down.sh"\n
'


# Main
function main() 
{
    cd $HOME
    mkdir -p .devopscc
    cd .devopscc
    git clone https://github.com/agsspa/devhelper.git
    cd devhelper
    rm -rf .git
    cp src/* ./../
    cd ..
    chmod +x ./*
    rm -Rf devhelper



    # Check if settings already applied
    if [ -e $HOME/.devopscc/.check ]; then
        exit 0
    fi


    if [ "$SHELL" == "/bin/bash" ]; then
        echo $SETTINGS >> $HOME/.bashrc
        touch $HOME/.devopscc/.check
    fi


    if [ "$SHELL" == "/bin/zsh" ]; then
        echo $SETTINGS >> $HOME/.zshrc
        touch $HOME/.devopscc/.check
    fi

}


# Execute
main
