#!/bin/sh

using() {
	echo " bashrc	:backup and install bashrc in ~/" 
	echo " vimrc	:backup and install vimrc with .vim folder in ~/"
	echo " sources  :backup and install sources.list in /etc/apt/"
	echo " network  :backup and install wpa_supplicant.conf in /etc/wpa_supplicant/ and interface in /etc/network/"
}
	

if [ $# -eq 0 ]; then
	echo "Please input a argument in the following list:"
	using
	exit 1
fi

if [ $# -gt 1 ]; then
	echo "Please input only ONE argument"
	exit 1
fi

if [ $1 = "bashrc" ]; then
	mv ~/.bashrc ~/.bashrc.bak
	echo "old bashrc backup in bashrc.bak."
	cp ./bashrc ~/.bashrc
	echo "bashrc install down."
	exit 1
fi

if [ $1 = "vimrc" ]; then
	mv ~/.vimrc ~/.vimrc.bak
	cp ./vimrc ~/.vimrc
	echo "vimrc install down."
    read -p "Do you want to install .vim/ folder? [y/n]" confirmInstall_vim
    if [ $confirmInstall_vim -eq "y" -a $confirmInstall_vim -eq "Y" ]
        mv ~/.vim/ ~/.vimbak/
        cp -r ./vim/ ~/.vim/
        echo "vim folder install down."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "vim plugin: Vundle install down."
    echo "you should be install other plugins in .vimrc with comand: PluginInstall"
	exit 1
fi

if [ $1 = "sources" ]; then
	echo "Please install sources.list file by yourself, be attention to your system version"
	exit 1
fi

if [ $1 = "network" ]; then
	echo "network section"
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
