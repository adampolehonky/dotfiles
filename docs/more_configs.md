#!/usr/bin/env bash


chflags nohidden ~/Library &&
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2 &&
defaults write -g NSScrollViewRubberbanding -int 0 &&
defaults write com.apple.addressbook ABShowDebugMenu -bool YES &&
defaults write com.apple.appstore ShowDebugMenu -bool true &&
defaults write com.apple.DiskUtility DUDebugMenuEnabled 1 &&
defaults write com.apple.dock expose-animation-duration -int 0 &&
defaults write com.apple.dock hide-mirror -bool true &&
defaults write com.apple.dock pinning -string start &&
defaults write com.apple.Dock showhidden -bool YES &&
defaults write com.apple.helpviewer DevMode -bool true &&
defaults write com.apple.iPhoto EmailApp Postbox &&
defaults write com.apple.iTunes disable-elastic-scroll -bool YES &&
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no &&
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false &&
defaults write com.apple.QuickTimePlayerX MGCinematicWindowDebugForceNoRoundedCorners 1 &&
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true &&
defaults write com.google.Chrome DisablePrintPreview -boolean true &&
defaults write com.apple.TextEdit ShowRuler 0 &&
defaults write com.google.Chrome.plist AppleEnableSwipeNavigateWithScrolls -bool FALSE &&
defaults write com.sublimetext ApplePressAndHoldEnabled -bool false &&
defaults write NSGlobalDomain KeyRepeat -int 0 &&
defaults write com.apple.finder FXEnExtensionChangeWarning -bool false &&
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO &&
defaults write NSGlobalDomain NSWindowResizeTime .1 &&
killall Dock;
killall SystemUIServer;
