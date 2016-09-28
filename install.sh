#!/bin/bash


echo 'Installing Vim configuration'
if [ -e ~/.vim ]
then
	mv ~/.vim ~/.vim.old
fi
if [ -e ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.old
fi
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/vimrc ~/.vimrc

echo 'Installing Tmux configuration'
if [ -e ~/.tmux.conf ]
then
	mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s `pwd`/tmux.conf ~/.tmux.conf

echo 'Installing Git configuration'
ln -s `pwd`/gitconfig ~/.gitconfig
