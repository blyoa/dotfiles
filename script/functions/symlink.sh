#!bin/bash

symlink(){
    DATE=`/bin/date '+%Y%m%d%H%M'`
    #backup
    if [ -e $2 ]; then
        if [ -f $2 ]; then
            cp -p $2 $2'-'$DATE'.backup'
        elif [ -d $2 ]; then
            cp -Rp $2 $2'-'$DATE'.backup'
        else
            echo 'cannot create backup'
            return
        fi
    fi

    ln -sf $1 $2 
}
