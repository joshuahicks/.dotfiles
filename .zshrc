# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# add apps to $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Theme
ZSH_THEME="robbyrussell"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Aliases
alias python=/usr/bin/python3
alias dc='docker-compose'
alias vim='nvim'
alias split='wezterm cli split-pane'
alias cl='clear'

# Config Aliases
alias vimconf='nvim ~/.config/nvim/init.lua'
alias vimset='nvim ~/.config/nvim/lua/settings.lua'
alias vimplug='nvim ~/.config/nvim/lua/plugins.lua'
alias vimkeys='nvim ~/.config/nvim/lua/keymaps.lua'
alias zshconf='nvim ~/.zshrc'
alias wezconf='nvim ~/.config/wezterm/wezterm.lua'

# NPM Aliases
#alias npm='pnpm'
alias pst='pnpm run serve'

# Directory Aliases
alias notes='cd ~/work/notes'
alias home='cd ~'

source $ZSH/oh-my-zsh.sh
