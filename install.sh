#!/bin/bash
#動いたよ!!!

FILES=(.zshrc .byobu .Xmodmap .bashrc .vim .vimrc )

echo ++++++++++++++++ linking ++++++++++++++++
for file in ${FILES[@]}
do
	ln -snfv $HOME/dotfiles/$file $HOME/$file

done

#neobundleのinstall
#未検証
#echo ++++++++++++++++ install neobundle ++++++++++++++++
#git clone https://github.com/shougo/neobundle.vim .vim/bundle/
