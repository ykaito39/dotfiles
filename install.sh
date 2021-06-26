#!/bin/bash
#動いたよ!!!

FILES=(.zshrc .byobu .Xmodmap .bashrc .vim .vimrc )
C_DIR="$(pwd)"

echo ++++++++++++++++ linking ++++++++++++++++
for file in ${FILES[@]}
do 
	chmod 655 $C_DIR/$file
	ln -sfv $C_DIR/$file $HOME/$file

done

#neobundleのinstall
#未検証
#echo ++++++++++++++++ install neobundle ++++++++++++++++
#git clone https://github.com/shougo/neobundle.vim .vim/bundle/
