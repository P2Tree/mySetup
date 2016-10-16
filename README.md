# mySetup

This file is my setup files in linux using. I use it in my Ubuntu 14.04, but also can used in other linux system.

## vimrc

I added vimrc and .vim folder in repo and because of some settings about vimrc in termial is distinguish with Gvim in desktop, so I stress that it is used in the vim of terminal. If you willing to use Gvim, please be careful in use of my vimrc.
You can find more information in my vimrc, I commonted many tips in it before and molokai.vim is my favourite theme in vim.
By the way, you SHOULD be read .vimrc, and complete some other operation because vim plugin-manager vundle and many other plugins should be installed. Please be attention to some plugins, they probably let your vim break down when you boot your vim with this vimrc, be clearly of contents in .vimrc;
You should be install some other software in your linux system for some of excited plugins depend on them.

- mv `vim/` to your home directory and rename it with `.vim/`;

- mv `vimrc` to your home directory and rename it with `.vimrc`;

## bashrc

- mv `bashrc` to your home directory and rename it with `.bashrc`, replace your old `.bashrc` and then `source .bashrc` of it;

## linux network

I added some of network setup files in repo, if you use embedded linux like respberrypi you should be love it.
And first be sure `wpa_supplicant` and `wireless_tools` were installed in 

- mv `interface` to `/etc/network/` and replace the default interface, I suggest you to backup default interface.

- mv `wpa_supplicant.conf` to `/etc/wpa_supplicant/` and replace the default `wpa_supplicant.conf`, also to backup default file.


