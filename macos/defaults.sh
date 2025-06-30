#!/bin/bash

### SYSTEM
sudo pmset -a displaysleep 15
sudo pmset -c sleep 0  # Disable sleep while charging
sudo pmset -b sleep 30 # Set sleep after 30 minutes on battery

# Set computer identity to hostname
sudo scutil --set ComputerName "${HOSTNAME}"
sudo scutil --set HostName "${HOSTNAME}"
sudo scutil --set LocalHostName "${HOSTNAME}"


# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable crash reporter
defaults write com.apple.CrashReporter DialogType none

# Disable application quarantine message for signed applications
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Don't save documents to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

### GLOBAL UI/UX SETTINGS
defaults write com.apple.dashboard mcx-disabled -boolean YES              # Disable useless shitty dashboard
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling" # Scrollbars visible when scrolling
defaults write -g AppleActionOnDoubleClick 'Maximize'                     # Maximize windows on double click

# Notification dismiss timeout
defaults write com.apple.notificationcenterui bannerTime -int 4

# Show battery percentage
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

# Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en" "ru" "ua"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Drag windows by holding CTRL + CMD and clicking anywhere
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true

### TRACKPAD SETTINGS
# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

### ACTIVITY MONITOR
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
defaults write com.apple.ActivityMonitor ShowCategory -int 100

### DESKTOP SERVICES
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

### SAFARI (if container exists)
# Don't send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Disable java in webkit
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

# Enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable Safari's debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Enable "Do Not Track"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Show full URL in address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

### DOCK SETTINGS
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 49
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.2
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Hot corners - Bottom right: Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

### FINDER SETTINGS
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder EmptyTrashSecurely -bool true
defaults write com.apple.finder DisableAllAnimations -bool true

# Show icons for hard drives, servers, and removable media on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Set default Finder view to list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Remove toolbar title rollover delay
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

### SCREENSHOTS
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Set screenshot format to PNG
defaults write com.apple.screencapture type -string "png"

# Save screenshots to Desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Enable screenshot thumbnail
defaults write com.apple.screencapture show-thumbnail -bool true

### MAIL (if used)
# Disable send and reply animations
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

### TEXT EDIT
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

### TIME MACHINE
# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine snapshots
sudo tmutil disable

### SECURITY IMPROVEMENTS
# Disable Bonjour multicast advertisements
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true

# Disable IR remote control
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool false

# Enable application firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Enable firewall stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# Disable wake-on modem
sudo pmset -a ring 0

# Disable wake-on LAN
sudo pmset -a womp 0

# Disable guest account
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Show IP address, hostname, OS version, etc. when clicking the clock
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

# Disable Siri voice feedback
defaults write com.apple.assistant.backedup "Use device speaker for TTS" -int 3

# Disable Spotlight search for these locations
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1

# Disable automatic updates (you should manually update for control)
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool false

# Disable diagnostics & usage data collection
defaults write /Library/Application\ Support/CrashReporter/DiagnosticMessagesHistory.plist AutoSubmit -bool false
defaults write /Library/Application\ Support/CrashReporter/DiagnosticMessagesHistory.plist ThirdPartyDataSubmit -bool false

### ADDITIONAL PRIVACY SETTINGS
# Disable analytics and improvements
defaults write com.apple.dt.Xcode DVTDisableMainThreadChecker 1

# Disable location services for system services
defaults write /var/db/locationd/Library/Preferences/ByHost/com.apple.locationd LocationServicesEnabled -bool false

### PERFORMANCE OPTIMIZATIONS
# Disable animations when opening an application from the Dock
defaults write com.apple.dock launchanim -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Shorten the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Make Mission Control animations faster
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable the over-the-top focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Disable animation when opening the Info window in Finder
defaults write com.apple.finder DisableAllAnimations -bool true

# Restart affected applications
echo "Restarting affected applications..."
for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Safari" \
	"ControlCenter" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null || true
done

echo "Done! Some changes may require a logout/restart to take effect."
echo "Security note: Check FileVault encryption status in System Settings > Privacy & Security"

killall Finder
killall Dock
