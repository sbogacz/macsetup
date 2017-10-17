#!/bin/bash

# install xcode
xcode-select --install

# accept xcode license
sudo xcodebuild -license

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install wget
brew install wget

# install iTerm2
cd /Applications
wget "https://iterm2.com/downloads/stable/iTerm2-3_1_3.zip"
unzip iTerm2-3_1_3.zip
rm iTerm2*.zip
cd -

# add it to dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

killall Dock

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
