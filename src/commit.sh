#!/usr/bin/env sh

set -e


BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' #No Color


# Main
function main()
{
    if [ ! -e .git ]; then
        echo "Impossibile procedere! Questo non e' un repo git o ti trovi in una sottodirectory"
        echo "Abort"
        exit 1
    fi

    git pull origin $1
    git status -vu
    echo "Stage all and commit? (Y/n)"
    read answer
    if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then
        git add .
        git commit
        git push origin $1
    fi

}


# Execute
if [ "$*" == "" ]; then
    echo -e "${RED}No arguments provided${NC}"
    echo "Usage: c <branch-name>"
    exit 1
fi


main
