# Function "exitSet" of "/arm/tools/setup/lib/modules/tool_utils.tcl" will move
# path item of "PATH_USER" to end of "PATH" each time we use command "module",
# this behavior will mess up settings of "PATH", so delete "PATH_USER" to
# avoiding this behavior.
unset PATH_USER

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export TERM=xterm-256color

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias envconfig="vim ~/Projects/config/env.sh"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias q="exit"
alias ..="cd .."
alias ll="ls -h -l"
alias lr="ls -R"
alias dh="df -h -a -T"
alias ds="du -sh"

# auto suffix to open file:
alias md="vim"
alias mvim="vim"
alias vi="vim"
alias gz="tar -xzvf"
alias tar="tar -xvf"
alias tgz="tar -xzvf"
alias bz2="tar -xzvf"
alias zip="unzip"



# special settings for MacOS
OS=`uname -s`
if [[ ${OS} == "Darwin" ]];then
  # Exchange system vim with macvim
  alias vim="/usr/local/Cellar/macvim/8.1-151_2/MacVim.app/Contents/MacOS/Vim"

  # for Homebrew
  export HOMEBREW_NO_AUTO_UPDATE=true # close homebrew update when install/upgrade software

  # for trash, which is a tools to move items into trash
  if [[ `command -v trash` ]];then
    alias rm="trash"
  fi
fi

# for qt
if [[ `command -v qmake` ]];then
  export PATH=/usr/local/opt/qt/bin:$PATH
  export LDFLAGS="-L/usr/local/opt/qt/lib"
  export CPPFLAGS="-I/usr/local/opt/qt/include"
  export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/usr/local/opt/qt
fi

# for ros2
#export PATH=~/ros2_crystal_install/ros2-osx/bin:$PATH
#export ROS_DISTRO=crystal # not ardent, bouncy
#echo source ~/ros2_crystal_install/ros2-osx/setup.zsh
#source ~/ros2_crystal_install/ros2-osx/setup.zsh # must be do this to init ros environment

# for binutils
export PATH=/usr/local/opt/binutils/bin:$PATH
export LDFLAGS="-L/usr/local/opt/binutils/lib"
export CPPFLAGS="-I/usr/local/opt/binutils/include"

# for sed-gnu
export PATH=/usr/local/opt/gnu-sed/bin:$PATH

# for gettext
if [[ `command -v gettext` ]];then
  export PATH=/usr/local/opt/gettext/bin:$PATH
  export LDFLAGS="-L/usr/local/opt/gettext/lib"
  export CPPFLAGS="-I/usr/local/opt/gettext/include"
fi

# for mysql
export PATH=$PATH:/usr/local/mysql/bin

# for django
#PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages/

if [[ `command -v fzf` ]];then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  if [[ `command -v fd` ]];then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude ".git"'
  else
    export FZF_DEFAULT_COMMAND='find . -type f'
  fi

  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  alias fvi='vim $(fzf)'
fi

# forbidden flow control
stty -ixon

# Start tmux
if [[ "`tty`" != "not a tty" && -z "${TMUX}" && -o login ]]; then
    tmux -V > /dev/null 2>&1
    if [[ $? == 0 ]]; then
        echo -n "Would you like to launch tmux? (y/n) [y]: "
        read line
        # The right pattern part can't be surrounded by double quote mark.
        if [[ "$line" == Y* || "$line" == y* || -z "$line" ]]; then
            unset line
            exec tmux
        else
            unset line
            clear
        fi
    else
        cat<<EOF
Warning: "tmux" can't work well, won't launch it!
EOF
    fi
fi

cd
clear
