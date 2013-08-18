#!/bin/bash

# spxd bash script to install sphinx-deployment to your sphinx docs project.
#
############################################################################
# Usage:
#   spxd [options]
#
# Options:
#   -h              Help
#   -p <docs_path>  Install sphinx_deployment to a specified docs path
############################################################################
# Example to install on <your_project/docs>
# $ cd <your_project>
# $ wget https://github.com/teracy-official/sphinx_deployment/scripts/spxd.sh && chmod +x ./spxd.sh && ./spxd.sh -p docs
#

function usage() {
    echo "Usage:"
    echo "  spxd [options]"
    echo ""
    echo "Options:"
    echo "  -h             Help"
    echo "  -p <docs_path> Install sphinx_deployment to a specified docs path"
}

function install() {
    echo "installing sphinx_deployment to '$1'..."
}


while getopts ":p:h" opt; do
    case $opt in
        p)
            install $OPTARG
            exit 0
            ;;
        h)
            usage
            exit 0
            ;;
        \?)
            echo "Invalid options -$OPTARG" >&2
            exit 1
            ;;
        :)
            if [ $OPTARG == "p" ]; then
                echo "Option -$OPTARG requires <docs_path> argument." >&2
            fi
            exit 1
            ;;
    esac
done
