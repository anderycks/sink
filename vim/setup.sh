# Setup my vim configuration.

VIMHOME=$HOME/.vim
VIMCOLORS=$VIMHOME/colors
VIMBUNDLE=$VIMHOME/bundle

if [[ $(uname -a | grep Darwin) ]]; then
    ln -s /Applications/MacVim.app/Contents/bin/mvim ~/Scripts/
fi

cp vimrc $HOME/.vimrc

mkdir -p $VIMCOLORS
wget https://raw.githubusercontent.com/jonathanfilip/vim-lucius/master/colors/lucius.vim \
    -O $VIMCOLORS/lucius.vim

git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim

vim +PluginInstall +qall

# This assumes all the initial setup for Node, Go, etc.
# has been done. Also requires build-essential and the like
# on Ubuntu.
cd $VIMBUNDLE/YouCompleteMe
python3 install.py --go-completer --ts-completer
