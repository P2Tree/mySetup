#!/bin/sh

using() {
    echo "USAGE:"
	echo "      ./run.sh bashrc	    :backup the old one and install bashrc in ~/" 
	echo "      ./run.sh vimrc	    :backup the old one and install vimrc with .vim folder in ~/"
    echo "      ./run.sh vimrc-make :install vim with compile mode"
	echo "      ./run.sh sources    :backup the old one and install sources.list in /etc/apt/"
	echo "      ./run.sh network    :backup the old one and install wpa_supplicant.conf in /etc/wpa_supplicant/ and interface in /etc/network/"
}
	

if [ $# -eq 0 ]; then
	echo "Please input a argument in the following list:"
	using
	exit 1
fi

if [ $# -gt 1 ]; then
	echo "Please input only ONE argument in the following list:"
    using
	exit 1
fi

if [ $1 = "bashrc" ]; then
	mv ~/.bashrc ~/.bashrc.bak
	echo "old bashrc backup in ~/.bashrc.bak."
	# cp -f ./bashrc ~/.bashrc
    ln ./bashrc ~/.bashrc
	echo "bashrc install down."
	exit 1
fi

if [ $1 = "vimrc" ]; then
    if [ -f ~/.vimrc ];then
    	mv ~/.vimrc ~/.vimrc.bak
    fi
	# cp -f ./vimrc ~/.vimrc
    ln ./vimrc ~/.vimrc
	echo "vimrc install down."
    read -p "Do you want to install .vim/ folder? [y/n]" confirmInstall_vim
    if [ $confirmInstall_vim = "y" ] || [ $confirmInstall_vim = "Y" ]; then
        if [ -d ~/.vim/ ];then
            cp -rf ~/.vim/* ~/.vimbak/
            rm -rf ~/.vim/
            echo "~/.vim/ folder is already existed, backup old .vim folder to ~/.vimbak/"
        fi
        # cp -rf ./vim/* ~/.vim/
        ln -s $(pwd)/vim ~/.vim
        echo "vim folder install down."
    fi
    if [ ! -f ~/.vim/bundle/Vundle.vim ];then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >> /dev/null
        echo "vim plugin: Vundle install down."
    else
        echo "vim plugin: Vundle is already installed"
    fi
    # install some other softwares for vim plugins: ctags ack
    echo "Install ctags into system..."
    sudo apt-get install exuberant-ctags >> /dev/null
    echo "Done!"
    echo "After then: "
    echo " 1. You should be install other plugins in .vimrc with comand: `:PluginInstall`"
    echo " 2. You should be install install software: ack-grep, to realize the enhanced searching function to the editor"
    echo " 3. You should be compiler YouCompleteMe plugin in ~/.vim/bundle/YouCompleteMe folder, and run ./install.py"
	exit 1
fi

if [ $1 = "vimrc-make" ];then
    read -p "Do you want to compile vim? [y/n]" confirmCompile_vim
    if [ $confirmCompile_vim = "y" ] || [ $confirmCompile_vim = "n" ]; then
        sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev git
        cd ~
        git clone https://github.com/vim/vim.git
        cd vim
        ./configure --with-features=huge \
                    --enable-multibyte \
                    --enable-rubyinterp \
                    --enable-pythoninterp \
                    --with-python-config-dir=/usr/lib/python2.7/config/ \
                    --enable-python3interp \
                    --with-python3-config-dir=/usr/lib/python3.5/config/ \
                    --enable-perlinterp \
                    --enable-luainterp \
                    --enable-gui=gtk2 \
                    --enable-cscope \
                    --prefix=/usr
        make VIMRUNTIMEDIR=/usr/share/vim/vim80
        sudo make install
    fi
    vim --version
    echo "Compile vim done."
fi

if [ $1 = "sources" ]; then
	echo "Please install sources.list file by yourself, be attention to your system version"
	exit 1
fi

if [ $1 = "network" ]; then
	echo "network section, not complete"
	exit 1
fi

if [ $1 = "-h" ] || [ $1 = "--help" ]; then
	echo "Using: run.sh (argument)"
	echo "	arguments in list:"
	using
	exit 1
fi

echo "Please input a right argument in the following list:"
using
