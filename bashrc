############################################################
# Simple but Cute and Helpful (TM) Bash Settings
#
# cat feedback >> "dicksonliuming@gmail.com"
# Thanks to kirtika.ruchandani@gmail.com
############################################################

#!/usr/bin/env bash
# ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# User Info
export USERNAME="Dickson Liuming"
export NICKNAME="PWE"

# Distribute bashrc into smaller, more specific parts
# ======= 0. contents =======
# 1. alias
# 2. defaults
# 3. functions
# 4. prompt

# ======= 1. alias =======
# Cute shell shortcuts
alias ls='ls --sort=extension --color=auto'
alias ll='ls -lh'
alias lal='ls -alh'
alias la='ls -A'
alias pms='sudo pm-suspend'
alias psg='ps -A | grep'
alias se='sudo gvim'
alias e='gvim'
alias smi='sudo make install'
alias l='ls -CF'
alias vi='vim'

# Cool colors for man pages
alias man="TERMINFO=~/.terminfo TERM=mostlike LESS=C PAGER=less man"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# This one is to take care of make
# Give me a nice, distinguishable make output
alias make='clear && make'
alias m='make'

# Some more, to avoid mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Git Commands
# Add and Commit are used as functions
alias gpo='git push origin master'
alias gps='git push'
alias gpl='git pull'
alias gs='git status'
alias gd='git diff'
alias gr='git reflog'
alias glf='git ls-files'

# Useful for C/C++ work
# R for recursive, p10 to show file paths
alias scope='cscope -CR -p10'

# Quickly load bashrc
alias gogo='source ~/.bashrc'

# ======= 2. defaults =======
# History Options
# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=2000000

export PATH=$HOME/scripts:$HOME/.local/bin:/usr/local/bin:$PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR='gvim' ALTERNATE_EDITOR='vim' VISUAL='gvim'
export VIM=/usr/bin/vim/
export VIMRUNTIME=/usr/share/vim/vim80/
export TERM=xterm-256color

# Bash History
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
export HISTIGNORE='&:clear:ls:cd:[bf]g:exit:[ t\]*'

# Save and reload history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# General UI
force_color_prompt=yes

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in
# (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# Input
# correct minor spelling errors in cd
shopt -s cdspell
#include dotfiles in wildcard expansion, and match case-insensitively
shopt -s dotglob
shopt -s nocaseglob

# ======= 3. functions =======
# Functions to aid git workflow
function ga(){
    git add $1
}

function gm(){
    git commit -m "$*"
}

function grt(){
    git reset $1
}

function gb(){
    git branch $1 $2
}

function gc(){
    git checkout $1
}

# Simplify apt-get search and install
function show ()
{
    apt-cache search $1
}

function giveme ()
{
    sudo apt install "$@"
}

# Useful unarchiver!
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1                ;;
            *.tar.gz)        tar xzf $1                ;;
            *.bz2)                bunzip2 $1                ;;
            *.rar)                rar x $1                ;;
            *.gz)                gunzip $1                ;;
            *.tar)                tar xf $1                ;;
            *.tbz2)                tar xjf $1                ;;
            *.tgz)                tar xzf $1                ;;
            *.zip)                unzip $1                ;;
            *.Z)                uncompress $1        ;;
            *)                        echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function psg() {
        if [ ! -z $1 ] ; then
                echo "Grepping for processes matching $1..."
                ps aux | grep $1 
        else
                echo "!! Need name to grep for"
        fi
}

# Because I am a lazy bum, and this is
# surpisingly helpful..
function ..()
{
    for i in `seq 1 $1`;
    do
        cd ../
    done;
}

# ======= 4. prompt =======
export black="\[\033[1;38;5;0m\]"
export red="\[\033[1;38;5;1m\]"
export orange="\[\033[1;38;5;130m\]"
export green="\[\033[1;38;5;2m\]"
export yellow="\[\033[1;38;5;3m\]"
export blue="\[\033[1;38;5;4m\]"
export bblue="\[\033[1;38;5;12m\]"
export magenta="\[\033[1;38;5;55m\]"
export cyan="\[\033[1;38;5;6m\]"
export white="\[\033[1;38;5;7m\]"
export coldblue="\[\033[1;38;5;33m\]"
export smoothblue="\[\033[1;38;5;111m\]"
export iceblue="\[\033[1;38;5;45m\]"
export turqoise="\[\033[1;38;5;50m\]"
export smoothgreen="\[\033[1;38;5;42m\]"
export defaultcolor="\[\e[0m\]"

# my PS1
PS1="${yellow}#\# ${red}\u@lazylady${white}-\A${blue} \w ${green}\$ ${defaultcolor}"

# ======= 5. USER =======

# Parrot
ROSMAT=~/Parrot/RollingSpiderEdu/MIT_MatlabToolbox

# ROS
source /opt/ros/indigo/setup.bash
source ~/catkin_ws/devel/setup.bash
export ROS_HOSTNAME=192.168.1.11
export ROS_MASTER_URI=http://192.168.1.43:11311
alias makeros='~/catkin_ws/catkin_make.sh $1'

# SSH
alias minipc='~/ssh_minipc'

# System environment path
export PATH=$PATH:$ROSMAT/bin:$ROSMAT/bin/utils:$ROSMAT/bin/firmware

# ======= 6. MAIN =======
# Welcome message
echo -ne "Good Morning, $NICKNAME! It's "; date '+%A, %B %-d %Y'
echo
# Check System with sensors, devices and memory
echo "Hardware Information:"
sensors  # Needs: 'sudo apt-get install lm-sensors'
uptime   # Needs: 'sudo apt-get install lsscsi'
lsscsi
free -m

