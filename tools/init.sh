function _backup() {
  _ds=$(date +"%s")
  echo "Backing up existing $1?(yes/no/exit):"
  while read yon; do
    case $yon in
      yes)echo "Backing up it to $1_$_ds..."
        mv $1 $1_$_ds
        echo "Backuped!";break;;
      no)echo "Deleting $1..."
        rm -rf $1
        echo "Deleted!";break;;
      exit)echo "Canceling installation...";exit;;
      *)echo "Unrecognized answer! Just type y or n!";continue;;
    esac
  done
}

if [ -d ~/.vim ];then
  _backup .vim
fi
if [ -f ~/.vimrc ];then
  _backup .vimrc
fi
if [ -d ~/.vim_kaid ];then
  _backup .vim_kaid
if

function _clone() {
  echo "Cloning Kaid's dotvim..."
  /usr/bin/env git clone git@github.com:kaid/dotvim.git .vim_kaid 2>&1 && _rslt=1 || _rslt=0
  if [ $_rslt -eq 0 ];then
    echo $_rslt
    /usr/bin/env git clone git://github.com/kaid/dotvim.git .vim_kaid
  fi
  echo "Cloned!"
}

_clone

echo "Installing Kaid's dotvim..."
mv ~/.vim_kaid ~/.vim
cd ~/.vim && /usr/bin/env git submodule init && /usr/bin/env git submodule update
ln -s ~/.vim/vimrc ~/.vimrc
echo "Installition done!"
