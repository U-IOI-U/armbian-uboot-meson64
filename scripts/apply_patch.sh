#!/bin/bash

BRANCH="${1:-v2022.10}"
for i in `find ../${BRANCH}/patch/ -type f 2>/dev/null | sort`; do
    if [ -f "$i" ]; then
    git apply --check "$i" 2>/dev/null
    if [ "$?" != "0" ]; then
        echo -e "[ \033[31m ERR \033[0m ] $i"
        git apply --stat "$i"
        git apply --check "$i"
    else
        echo -e "[ \033[32m OK  \033[0m ] $i"
        git apply "$j" >/dev/null 2>&1
    fi
    fi
done

exit 0
