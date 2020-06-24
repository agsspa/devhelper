#!/usr/bin/env sh

set -e


BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' #No Color


# Main
function main() 
{
    echo -e "${BLUE}Uninstalling...${NC}"
    echo #
    cd $HOME
    rm -fR .devopscc
    echo -e "${BLUE}Done.${NC}"
}

main
