#!/bin/bash

### BEGIN INIT INFO
# Provides:          skeleton
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Should-Start:      $portmap
# Should-Stop:       $portmap
# X-Start-Before:    nis
# X-Stop-After:      nis
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     true
# Short-Description: initscript
# Description:       A init script to add application utilities bin folder to
#                    path.

### END INIT INFO

# INIT
#-----
printf " |_   _|     (_) |        \n"
printf "   | |  _ __  _| |_       \n"
printf "   | | | '_ \| | __|      \n"
printf "  _| |_| | | | | |_ _ _ _ \n"
printf " |_____|_| |_|_|\__(_|_|_)\n\n"
#################################

#################################
# RUN THIS SCRIPT THEN GET CODING
#################################
# Get all dependencies
#---------------------
printf "Initializing...\n"
if [ ! -d utilities ]
 then 
    mkdir utilities
fi
if [ ! -e utilities/heroku-linux-amd64.tar.gz ]
 then 
    wget -P utilities https://cli-assets.heroku.com/branches/stable/heroku-linux-amd64.tar.gz
fi
# Inflate dependencies
#---------------------
printf "Processing...\n"
if [ ! -d utilities/heroku-linux-amd64 ]
 then
    tar -xvzf utilities/heroku-linux-amd64.tar.gz -C utilities
    rm utilities/heroku-linux-amd64.tar.gz
fi

# Utilities Area
#---------------

# Making $HOME/bin available
if [ ! -d $HOME/bin ]
 then
    mkdir $HOME/bin
fi

# Get project directory path
#---------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
printf "Current Directory: $DIR\n"

# set PATH so it includes application utilities bin directories
#--------------------------------------------------------------
printf "Setting Path\n"
printf "Utility: Heroku CLI\n"
if [ ! -h $HOME/bin/heroku ]
 then
    ln -s $DIR/utilities/heroku/bin/heroku $HOME/bin/heroku
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

heroku login
exit 0