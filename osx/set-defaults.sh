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
# Turn off Terminal prompt markers
defaults write com.apple.Terminal AutoMarkPromptLines -int 0


#######
# Dock

# Hide it by default
defaults write com.apple.dock autohide -bool true
# Dock on right
defaults write com.apple.dock orientation -string "right"
# Don't show recent apps
defaults write com.apple.dock "show-recents" -bool false
# Kill it to apply settings
killall Dock


#########
# Safari

# Don't autofill/remember passwords
defaults write com.apple.Safari AutoFillPasswords -bool false
# Use DuckDuckGo as default search
defaults write com.apple.Safari SearchProviderIdentifier -string "com.duckduckgo"
# Show favicons on tabs
defaults write com.apple.Safari ShowIconsInTab -bool true
# Enable developer tools
defaults write com.apple.Safari "WebKitPreferences.developerExtrasEnabled" -bool true


