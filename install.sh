#!/usr/bin/env bash

set -e


BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' #No Color


SETTINGS0="# DevOpsCC helpers"
SETTINGS1="export DISPLAY=:0"
SETTINGS2="alias h='vim /mnt/c/Windows/System32/drivers/etc/hosts'"
SETTINGS3="alias c='~/.devopscc/commit.sh'"
SETTINGS4="alias b='~/.devopscc/bootstrap.sh'"
SETTINGS5="alias u='~/.devopscc/up.sh'"
SETTINGS6="alias s='~/.devopscc/stop.sh'"
SETTINGS7="alias d='~/.devopscc/down.sh'"


# Main
function main() 
{
    echo -e "${BLUE}Installing...${NC}"
    echo #
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
        echo -e "${BLUE}Settings already applied...${NC}"
        echo #
        exit 0
    fi


    if [ "$SHELL" == "/bin/bash" ]; then
        echo $SETTINGS0 >> $HOME/.bashrc
        echo $SETTINGS1 >> $HOME/.bashrc
        echo $SETTINGS2 >> $HOME/.bashrc
        echo $SETTINGS3 >> $HOME/.bashrc
        echo $SETTINGS4 >> $HOME/.bashrc
        echo $SETTINGS5 >> $HOME/.bashrc
        echo $SETTINGS6 >> $HOME/.bashrc
        echo $SETTINGS7 >> $HOME/.bashrc
        touch $HOME/.devopscc/.check
        #source $HOME/.bashrc
    fi


    if [ "$SHELL" == "/bin/zsh" ]; then
        echo $SETTINGS0 >> $HOME/.zshrc
        echo $SETTINGS1 >> $HOME/.zshrc
        echo $SETTINGS2 >> $HOME/.zshrc
        echo $SETTINGS3 >> $HOME/.zshrc
        echo $SETTINGS4 >> $HOME/.zshrc
        echo $SETTINGS5 >> $HOME/.zshrc
        echo $SETTINGS6 >> $HOME/.zshrc
        echo $SETTINGS7 >> $HOME/.zshrc
        touch $HOME/.devopscc/.check
        #source $HOME/.zshrc
    fi

    echo -e "${BLUE}Install successfull.${NC}"

}


# Execute
main
