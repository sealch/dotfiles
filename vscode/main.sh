#!/bin/bash

code --install-extension dbaeumer.vscode-eslint
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension whizkydee.material-palenight-theme
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension aaron-bond.better-comments
code --install-extension mikestead.dotenv
code --install-extension github.vscode-pull-request-github
code --install-extension eamodio.gitlens
code --install-extension quicktype.quicktype
code --install-extension ms-python.vscode-pylance
code --install-extension christian-kohler.path-intellisense

cp $PWD/vscode/settings.json $HOME/Library/Application\ Support/Code/User
cp $PWD/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User