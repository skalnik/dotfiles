#!/bin/sh

echo '🍎 Setting some preferered MacOS defaults.'

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Hide dock by default
defaults write com.apple.dock autohide -bool true
# Dock on right
defaults write com.apple.dock orientation -string "right"

# Don't show recent apps in dock
defaults write com.apple.dock "show-recents" -bool false
