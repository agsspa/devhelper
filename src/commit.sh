#!/usr/bin/env sh

set -e


# Main
function main()
{
    if [ ! -e .git ]; then
        echo "Impossibile procedere, questo non e' un repo git o ti trovi in una sottodirectory"
        exit 1
    fi

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

