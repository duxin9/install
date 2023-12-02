#!/usr/bin/env bash

set -x

# -- KEYBOARD --

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
# When the key repeat starts (default is 15 or 225ms)
defaults write -g InitialKeyRepeat -int 15
# Key repeat (default is 2 or 30ms)
defaults write -g KeyRepeat -int 2

# Disable Auto Capitalization and Automatic Periods
# Disable AutoCorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic period substitutions
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# -- FINDER --

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true
# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Disable .DS_Store file creation on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Disable .DS_Store file creation on external media (USB)
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Always Search Within Folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show external hard drives on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# Hide hard drives on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# Show mounted servers on the desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# Show removable media on the desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# -- DOCK --
# Disable autohide
# osascript -e 'tell application "System Events" to set the autohide of the dock preferences to false'
# Hide recents
# osascript -e 'tell application "System Events" to set the show recents of the dock preferences to false'

# -- MISC --
# Disable CrashReporter dialog
defaults write com.apple.CrashReporter DialogType -string "none"
