#!/usr/bin/env sh

function _backup() {
  _ds=$(date +"%s")
  echo "Back up existing $1?(yes/no/exit):"
  echo "Caution! Answer no will delete your existing $1!"
  while read yon;do
    case $yon in
      yes)echo "Backing up it to $1_$_ds..."
        mv $1 $1_$_ds
        echo "Backuped!";break;;
      no)echo "Deleting $1..."
        rm -rf $1
        echo "Deleted!";break;;
      exit)echo "Canceling installation...";exit;;
      *)echo "Unrecognized answer! Just type yes, no or exit!";;
    esac
  done < /dev/tty
}

if [ -d ~/.vim ];then _backup ~/.vim;fi
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ];then _backup ~/.vimrc;fi
if [ -d ~/.vim_kaid ];then _backup ~/.vim_kaid;fi

function _clone() {
  echo "Cloning Kaid's dotvim..."
  /usr/bin/env git clone git@github.com:kaid/dotvim.git ~/.vim_kaid 2>/dev/null
  if [ $? -ne 0 ];then
    /usr/bin/env git clone git://github.com/kaid/dotvim.git ~/.vim_kaid
  fi
  if [ $? -eq 0 ];then echo "Cloned!";fi
}

_clone

echo "Installing Kaid's dotvim..."
mv ~/.vim_kaid ~/.vim
cd ~/.vim && /usr/bin/env git submodule init && /usr/bin/env git submodule update
mkdir ~/.vim/autoload
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/bundle/pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
echo "Installation done!"

exit $?
