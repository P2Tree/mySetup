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
	sudo mv ~/.bashrc ~/.bashrc.bak
	echo "old bashrc backup in bashrc.bak."
	sudo cp ./bashrc ~/.bashrc
	sudo cp -r ./shells/ ~/.shells/
	echo "bashrc and shells folder install down."
	exit 1
fi

if [ $1 = "vimrc" ]; then
	sudo mv ~/.vimrc ~/.vimrc.bak
	sudo mv ~/.vim/ ~/.vimbak/
	echo "old vimrc and .vim folder backup in vimrc.bak and vimbak/."
	sudo cp ./vimrc ~/.vimrc
	sudo cp -r ./vim/ ~/.vim/
	echo "vimrc and vim folder install down."
	exit 1
fi

if [ $1 = "sources" ]; then
	sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
	echo "old sources.list backup in sources.list.bak."
	sudo cp ./sources.list_of_ubuntu /etc/apt/sources.list
	echo "sources.list install done."
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
