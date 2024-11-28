# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add apps to $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/Cellar/llvm/17.0.6_1/bin:$PATH"
export PATH="$HOME/.zig/zig-stable/:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

export GOPATH=$(go env GOPATH)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#ebdbb2,bg:#282828,hl:#b16286
    --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b
    --color=info:#d65d0e,prompt:#458588,pointer:#fe8019
    --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f'

# Theme
ZSH_THEME="robbyrussell"

# Fast Node Manager
eval "$(fnm env --use-on-cd)"

# Direnv (used for python virtual envs)
eval "$(direnv hook zsh)"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Aliases
alias dc='docker-compose'
alias dcps='docker-compose ps --format "table {{.Name}}\t{{.Status}}\t{{.Ports}}"'
alias dockprune='docker images prune && docker volume prune'
alias wdc='watch docker compose'

alias pm='pm2'
alias vim='nvim .'
alias brewup='brew update && brew upgrade'
alias py='python3'

# Directory Aliases
alias notes='cd ~/work/notes'
alias home='cd ~'

# Function to change guthub directories using fzf
github_cd() {
    cd "$(find ~/work ~/personal -path '*/github/*' -prune -type d -maxdepth 2 | sed 's|.*/github/\([^/]*\)/.*|\1|' | fzf -e)" && zle -I
}
zle -N github_cd
bindkey '^P' github_cd

# Mainly used to go back into vim
foreground() {
    fg
}
zle -N foreground
bindkey '^E' foreground

source $ZSH/oh-my-zsh.sh
