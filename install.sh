#!/usr/bin/env sh
REPODIR=${REPODIR:-"$PWD"}

rmmsg () {
    echo "Remove: ~/.vim ~/.vimrc ~/.gvimrc"
}

create_symlinks () {
    if [ -f ~/.vim ]; then
        echo "ERROR: ~/.vim already exists"
        rmmsg
        exit
    else
        ln -sfn $REPODIR ~/.vim
    fi

    if [ -f ~/.vimrc ]; then
        echo "ERROR: ~/.vimrc already exists"
        rmmsg
        exit
    else
        ln -sfn $REPODIR/vimrc ~/.vimrc
    fi

    if [ -f ~/.gvimrc ]; then
        echo "ERROR: ~/.gvimrc already exists"
        rmmsg
        exit
    else
        ln -sfn $REPODIR/gvimrc ~/.gvimrc
    fi
  }

which git > /dev/null
if [ "$?" != "0" ]; then
  echo "You need git installed."
  exit 1
fi

create_symlinks

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
