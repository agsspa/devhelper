#!/usr/bin/env bash

set -e


BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' #No Color


# Main
function main() 
{
    
    # Check if settings already applied for verbose message
    if [ -e $HOME/.devopscc/.check ]; then
        echo -e "${BLUE}Updating...${NC}"
        echo #
    else 
        echo -e "${BLUE}Installing...${NC}"
        echo #
    fi

    cd $HOME
    mkdir -p .devopscc
    cd .devopscc
    git clone https://github.com/agsspa/devhelper.git
    cd devhelper
    rm -rf .git
    cp src/* ./../
    cp settings.txt ../
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
        cat $HOME/.devopscc/settings.txt >> $HOME/.bashrc
        rm $HOME/.devopscc/settings.txt
        touch $HOME/.devopscc/.check
        #source $HOME/.bashrc
    fi


    if [ "$SHELL" == "/bin/zsh" ]; then
        cat $HOME/.devopscc/settings.txt >> $HOME/.zshrc
        rm $HOME/.devopscc/settings.txt
        touch $HOME/.devopscc/.check
        #source $HOME/.zshrc
    fi

    echo -e "${BLUE}Install successfull.${NC}"

}


# Execute
main
