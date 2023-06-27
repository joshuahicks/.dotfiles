# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add apps to $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

# Theme
ZSH_THEME="robbyrussell"

# Fast Node Manager
eval "$(fnm env --use-on-cd)"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git docker-compose zsh-autosuggestions zsh-syntax-highlighting)

# Aliases
alias python=/usr/bin/python3
alias dc='docker-compose'
alias wdc='watch docker-compose'
alias vim='nvim .'
alias brewup='brew update && brew upgrade'

# Config Aliases
alias vimconf='nvim ~/.config/nvim/init.lua'
alias vimset='nvim ~/.config/nvim/lua/settings.lua'
alias vimplug='nvim ~/.config/nvim/lua/plugins.lua'
alias vimkeys='nvim ~/.config/nvim/lua/keymaps.lua'
alias wezconf='nvim ~/.config/wezterm/wezterm.lua'
alias zshconf='nvim ~/.zshrc'

# Directory Aliases
alias notes='cd ~/work/notes'
alias home='cd ~'

source $ZSH/oh-my-zsh.sh
