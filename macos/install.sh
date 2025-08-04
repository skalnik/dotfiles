#!/bin/sh

if [ "$(uname)" != "Darwin" ]; then
  echo "🐧 This is just meant for MacOS!"
  exit 0
fi

echo "🍎 Setting some preferered MacOS defaults."

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# Dark/Light mode automatic switching
defaults write NSGlobslDomain AppleInterfaceStyleSwitchesAutomatically -bool true
# Turn off Terminal prompt markers
defaults write com.apple.Terminal AutoMarkPromptLines -int 0
# Weeks start on Monday
defaults write -globalDomain AppleFirstWeekday -dict gregorian 2
# AM/PM → 🌅/🌃
defaults write -globalDomain AppleICUDateTimeSymbols '{ 5 = ("\Ud83c\Udf05", "\Ud83c\Udf03"); }'


#######
# Dock

# Hide it by default
defaults write com.apple.dock autohide -bool true
# Dock on bottom
defaults write com.apple.dock orientation -string "bottom"
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


# Setup light auto-turn on
DIR=$(pwd -P "$0")/macos
mkdir ~/Library/LaunchAgents/
cp $DIR/launched.litra-auto.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/launched.litra-auto.plist
