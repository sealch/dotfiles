#!/usr/bin/env bash

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

while [[ -z "$USER_EMAIL" ]]; do
  read -e -p "$(success '📧 Enter your email: ')" USER_EMAIL
done

if ! command -v brew &>/dev/null; then
  info "🍺 Installing homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add homebrew to PATH for current session
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  
  # Verify brew is now available
  if ! command -v brew &>/dev/null; then
    error "Homebrew installation failed or not in PATH"
    exit 1
  fi
  
  brew update
  brew --version
else
  # Ensure homebrew is in PATH even if already installed
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

## general
success "🖥 Installing general apps...\n"
general_apps=(
  slack
  spotify
  itsycal
  telegram
  google-chrome
  brave-browser
  the-unarchiver
  karabiner-elements
  bartender
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
  cursor
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
  z
  gh
  jq
  xz
  git
  fzf
  wget
  tree
  htop
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
# Use proper zsh path based on installation method
if [[ -f "/opt/homebrew/bin/zsh" ]]; then
  sudo chsh -s /opt/homebrew/bin/zsh "$USER"
elif [[ -f "/usr/local/bin/zsh" ]]; then
  sudo chsh -s /usr/local/bin/zsh "$USER"
else
  sudo chsh -s "$(which zsh)" "$USER"
fi

info "🤌 Installing oh-my-zsh..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

info "👽 Installing starship prompt..."
brew install starship

info "Installing zsh autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

info "Installing shell syntax highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

info "🔧 Creating and configuring .zshrc..."
cat > ~/.zshrc << 'EOF'
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME=""

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Starship prompt
eval "$(starship init zsh)"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Homebrew autosuggestions and syntax highlighting
if [[ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
EOF

## languages
success "🔮 Installing languages\n"

info "🛠 Installing Node and TypeScript..."
# Install nvm first, then use it to install node
brew install nvm
# Create nvm directory if it doesn't exist
mkdir -p ~/.nvm
# Source nvm for current session
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
# Install latest LTS node and npm packages
nvm install --lts
nvm use --lts
npm install -g typescript

info "🐍 Installing Python..."
brew install python@3 ipython pyenv
python3 --version
pyenv --version

info "⚙️ Installing Golang..."
brew install golang

info "🤡️ Installing Java..."
brew install --cask java
java --version

## fonts
success "Installing fonts..."
brew tap homebrew/cask-fonts
brew update

brew install --cask font-hack-nerd-font

success "Post cleanup..."
brew cleanup

## keygen
info "🔑 Generating SSH keys (Ed25519 with 150 rounds of KDF)..."
if [[ ! -f ~/.ssh/id_ed25519 ]]; then
  ssh-keygen -t ed25519 -o -a 150 -C "${USER_EMAIL}" -f ~/.ssh/id_ed25519 -N ""
else
  warning "Ed25519 SSH key already exists, skipping..."
fi

info "🔑 Generating SSH keys (RSA with 4096 bits and 150 rounds of KDF)..."
if [[ ! -f ~/.ssh/id_rsa ]]; then
  ssh-keygen -t rsa -b 4096 -o -a 150 -C "${USER_EMAIL}" -f ~/.ssh/id_rsa -N ""
else
  warning "RSA SSH key already exists, skipping..."
fi

warning "If its first system boot ssh keys may be weak"

info "🔧 Running macOS defaults configuration..."
if [[ -f "macos/defaults.sh" ]]; then
  bash macos/defaults.sh
else
  warning "macos/defaults.sh not found, skipping..."
fi

info "🖥 Installing iTerm2 settings..."
if [[ -f "iterm/install.sh" ]]; then
  bash iterm/install.sh
else
  warning "iterm/install.sh not found, skipping..."
fi

success '✨ Done!'

