#!/usr/bin/env sh

INSTALLDIR=${INSTALLDIR:-"$PWD"}
create_symlinks () {
    if [ ! -f ~/.vim ]; then
        echo "Now, we will create ~/.vim and ~/.vimrc files to configure Vim."
        ln -sfn $INSTALLDIR ~/.vim
    fi

    if [ ! -f ~/.vimrc ]; then
        ln -sfn $INSTALLDIR/vimrc ~/.vimrc
        ln -sfn $INSTALLDIR/gvimrc ~/.gvimrc
    fi
  }

which git > /dev/null
if [ "$?" != "0" ]; then
  echo "You need git installed."
  exit 1
fi

which vim > /dev/null
if [ "$?" != "0" ]; then
  echo "You need vim installed."
  exit 1
fi

if [ ! -d "bundle" ]; then
    echo "Creating directories."
    mkdir bundle
    mkdir -p tmp/backup tmp/swap tmp/undo
fi

if [ ! -d "bundle/vundle" ]; then
    echo "Installing Vundle (https://github.com/gmarik/vundle)."
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi

vim +PluginInstall +qall 2>/dev/null
