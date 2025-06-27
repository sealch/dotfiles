#!/bin/bash

# iTerm2 Settings Installation Script
echo "Installing iTerm2 settings..."

# Backup existing settings
if [ -f ~/Library/Preferences/com.googlecode.iterm2.plist ]; then
    echo "Backing up existing iTerm2 settings..."
    cp ~/Library/Preferences/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist.backup
fi

# Copy new settings
echo "Installing new iTerm2 settings..."
cp com.googlecode.iterm2.plist ~/Library/Preferences/

echo "iTerm2 settings installed successfully!"
echo "Please restart iTerm2 to apply the new settings." 