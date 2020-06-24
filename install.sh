#!/usr/bin/env sh

set -e


SETTINGS='
export DISPLAY=:0
alias h="vim /mnt/c/Windows/System32/drivers/etc/hosts"
alias c="~/.devopscc/commit.sh"
alias b="~/.devopscc/bootstrap.sh"
alias u="~/.devopscc/up.sh"
alias s="~/.devopscc/stop.sh"
alias d= "~/.devopscc/down.sh
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
    cp src/* ./


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
