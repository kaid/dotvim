if [ -d ~/.vim_kaid ];then
  rm -rf ~/.vim_kaid
  echo "Cloning Kaid's dotvim..."
  /usr/bin/env git clone git@github.com:kaid/dotvim.git .vim_kaid 2>&1 && _rslt=1 || _rslt=0
fi

if [ $rslt==0 ];then
  /usr/bin/env git clone git://github.com/kaid/dotvim.git .vim_kaid
fi

echo "Cloned!"

function _backup() {
  _ds=$(date +"%s")
  echo "Backing up existing $1?(y/n):"
  while read yon; do
    case $yon in
      y)echo "Backing up it to $1_$_ds...";
        mv $1 $1_$_ds;
        echo "Backuped!";break;;
      n)echo "Deleting $1..."
        rm -rf $1;
        echo "Deleted!";break;;
      *)echo "Unrecognized answer! Just type y or n!";;
    esac
  done
}

if [ -d ~/.vim ];then
  _backup .vim
fi
if [ -f ~/.vimrc ];then
  _backup .vimrc
fi

echo "Installing Kaid's dotvim..."
mv ~/.vim_kaid ~/.vim
cd ~/.vim && /usr/bin/env git submodule init && /usr/bin/env git submodule update
ln -s ~/.vim/vimrc ~/.vimrc
echo "Installition done!"
