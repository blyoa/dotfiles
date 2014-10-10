#!/bin/bash

cd ${0%/*}/..


find . -type d -name "script" -prune -o -name "install.sh" -print | while read installer
do 
    bash -c "${installer}"
done 
