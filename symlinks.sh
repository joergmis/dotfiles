#!/bin/bash

rm ~/.alacritty.yml \
  ~/.ctags \
  ~/.tmux.conf \
  ~/.vimrc \
  ~/.config/qutebrowser/bookmarks/urls

ln -s $(pwd)/.alacritty.yml ~/.alacritty.yml
ln -s $(pwd)/.ctags ~/.ctags
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.config/qutebrowser/bookmarks/urls ~/.config/qutebrowser/bookmarks/urls
