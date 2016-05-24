#!/bin/sh
#true or no
echo -n "AppleShowAllFiles ? (y/n)"
read is_allow

#defaults write com.apple.finder QuitMenuItem -bool YES  设置Finder默认是打开的

if [[ $is_allow = "y" ]]; then
	defaults write com.apple.finder AppleShowAllFiles TRUE
	killall Finder
fi

if [[ $is_allow = "n" ]]; then
	defaults write com.apple.finder AppleShowAllFiles FALSE
	killall Finder
fi
