#!/usr/bin/env bash

DEFAULT_HOSTNAME="mbp"

### COLORS
OFF='\033[0m' # Reset

RED='\033[0;31m'
GREEN='\033[0;32m'    
YELLOW='\033[0;33m'
BLUE='\033[0;34m'

### Logger
success() {
  echo -e "$GREEN$1$OFF"
}

info() {
  echo -e "$BLUE$1$OFF"
}

warning() {
  echo -e "$YELLOW$1$OFF"
}

error() {
  echo -e "$RED$1$OFF"
}

read -e -p "$(success '💻 Enter computer name: ')" -i "${DEFAULT_HOSTNAME}" HOSTNAME 
read -e -p "$(success '📧 Enter your email: ')" USER_EMAIL

if ! command -v brew &>/dev/null; then
  info "🍺 Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update

  brew --version
fi

## general
success "🖥 Installing general apps...\n"
general_apps=(
  slack
  spotify
  itsycal
  telegram
  google-chrome
  the-unarchiver
)

for package in "${general_apps[@]}"; do
  info "⚙️ Installing ${package}..."
  brew install --cask "${package}"
done

## development
success "👷‍♂️ Installing dev tools...\n"

info "🚢 Installing Docker..."
brew install docker

dev_tools=(
  lens
  iterm2
  postman
  wireshark
  tableplus
  sublime-text
  visual-studio-code
)

for package in "${dev_tools[@]}"; do
  info "⚙️ Installing ${package}..."
  brew install --cask "${package}"
done

## utils
success "🔬 Installing network/traffic analysis tools..."
utils=(
  tmux
  ngrok
  tcpdump
)

for package in "${utils[@]}"; do
  info "⚙️ Installing ${package}..."
  brew install "${package}"
done

success "🛠 Installing misc developer CLI-tools..."
dev_utils=(
  jq
  xz
  git
  wget
  tree
  gzip
  unrar
  ffmpeg
  awscli
)

for package in "${dev_utils[@]}"; do
  info "⚙️ Installing ${package}..."
  brew install "${package}"
done

## configure shell
success "🐚 Configuring shell"

info "👺 Installing zsh..."
brew install zsh

info "Setting zsh as default..."
chsh -s /usr/local/bin/zsh

info "🤌 Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

info "👽 Installing spaceship theme..."
brew install spaceship

## languages
success "🔮 Installing languages\n"

info "🛠 Installing Node and TypeScript..."
brew install nvm node typescript

info "🐍 Installing Python..."
brew install python@3.9 ipython pyenv
python --version
pyenv --version

info "🦀 Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup default stable
rustup update
rustc --version

info "⚙️ Installing Golang..."
brew install golang

info "🤡️ Installing Java..."
brew install --cask java
java --version

success "🔧 Configuring VSCode.."
./vscode/main.sh

success "⚙️ Configuring Git..."
./git/main.sh

## fonts
success "Installing fonts..."
brew tap caskroom/fonts
brew tap homebrew/cask-fonts
brew update

fonts=(
  font-fira-code
  font-hack-nerd-font
)

brew install --cask "${fonts[@]}"

success "Post cleanup..."
brew cleanup

## macos
info "💻 Changing macOS settings..."
./macos/defaults.sh

## keygen
info "🔑 Generating SSH keys (Ed25519 with 150 rounds of KDF)..."
ssh-keygen -t ed25519 -o -a 150 -C "${USER_EMAIL}" -f ~/.ssh/id_ed25519

info "🔑 Generating SSH keys (RSA with 4096 bits and 150 rounds of KDF)..."
ssh-keygen -t rsa -b 4096 -o -a 150 -C "${USER_EMAIL}" -f ~/.ssh/id_rsa

warning "If its first system boot ssh keys may be weak"

success '✨ Done!'