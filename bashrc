############################################################
# Simple but Cute and Helpful (TM) Bash Settings
#
# cat feedback >> "kirtika.ruchandani@gmail.com"
############################################################

#!/usr/bin/env bash
# ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# User Info

export USERNAME="Dickson Liuming"
export NICKNAME="PWE"

# Distribute bashrc into smaller, more specific files

source ~/bashrc/shells/defaults
source ~/bashrc/shells/functions
source ~/bashrc/shells/alias
source ~/bashrc/shells/prompt   # Fancy prompt with time and current working dir

# Welcome message
echo -ne "Good Morning, $NICKNAME! It's "; date '+%A, %B %-d %Y'
echo
echo "Hardware Information:"
sensors  # Needs: 'sudo apt-get install lm-sensors'
uptime   # Needs: 'sudo apt-get install lsscsi'
lsscsi
free -m
