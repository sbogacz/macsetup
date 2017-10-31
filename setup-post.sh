#!/bin/zsh

# install zsh-syntax highlighting and zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# make a copy of the old .zshrc
cp ~/.zshrc ~/.zshrc_copy

# update zshrc
cat configured_zshrc > ~/.zshrc
source ~/.zshrc

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# get fonts
CUR_DIR=$0:A
cd ~
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# install fzf 
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# install python properly
brew install python
brew install python3

# install go
brew install go
go get -u jrubin.io/zb

# install neovim
brew install neovim
pip2 install neovim
pip3 install neovim

# install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install onedark
curl -fLo ~/.local/share/nvim/site/autoload/onedark.vim --create-dirs \
    https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim

# install Plugins
nvim +PlugInstall +GoInstallBinaries

mkdir ~/.config
cd ~/.config
git clone https://github.com/sbogacz/dotconfig.git nvim


