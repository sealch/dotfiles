#!/bin/bash

### SYSTEM
sudo pmset -a displaysleep 15
sudo pmset -c sleep 0  # Disable sleep while charging
sudo pmset -b sleep 30 # Set sleep after 30 minutes on battery

# Avoids appearing your name in local networks and in various preference files
sudo scutil --set ComputerName "${HOSTNAME}"
sudo scutil --set HostName "${HOSTNAME}"
sudo scutil --set LocalHostName "${HOSTNAME}"

defaults write com.apple.dashboard mcx-disabled -boolean YES              # Disable useless shitty dashboard
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling" # Scrollbars visible when scrolling
defaults write -g AppleActionOnDoubleClick 'Maximize'                     # Maximize windows on double click

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Notification dismiss timeout:
defaults write com.apple.notificationcenterui bannerTime -int 4

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent YES

# Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en" "ru" "ua"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable crash reporter
defaults write com.apple.CrashReporter DialogType none

# Don't save documents to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

### SAFARI
# Don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Disable java shit in webkit
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

### DESKTOP
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set dock size
defaults write com.apple.dock tilesize -int 40

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Enable tap to click.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

### Finder
defaults write com.apple.finder AppleShowAllFiles -bool true               # Show hidden files.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true           # Show all file extensions.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Disable file extension change warning.
defaults write com.apple.finder ShowStatusBar -bool true                   # Show status bar.
defaults write com.apple.finder ShowPathbar -bool true                     # Show path bar.
defaults write com.apple.finder ShowRecentTags -bool false                 # Hide tags in sidebar.
defaults write com.apple.finder QuitMenuItem -bool true                    # Allow quitting finder via ⌘ + Q.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"        # When performing a search, search the current folder by default
defaults write com.apple.finder _FXSortFoldersFirst -bool true             # Keep folders on top when sorting by name
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library      # Show the ~/Library folder

killall Finder
killall Dock
