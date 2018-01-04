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
gradle='https://services.gradle.org/distributions/gradle-4.4.1-bin.zip'
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

# Dependencies
#---------------------
printf "Gathering...\n"
if [ ! -d utilities/gradle* ]
 then 
    wget -P utilities $gradle
    printf "Processing...\n"
    unzip utilities/gradle*.zip -d utilities
    rm utilities/gradle*.zip
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
printf "Utility: Gradle 4.4.1\n"
if [ ! -h $HOME/bin/gradle ]
 then
    ln -s $DIR/utilities/gradle*/bin/gradle $HOME/bin/gradle
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#gradle wrapper
gradle build
exit 0