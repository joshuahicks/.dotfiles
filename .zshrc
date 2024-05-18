# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add apps to $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/Cellar/llvm/17.0.6_1/bin:$PATH"
export PATH="$HOME/.zig/zig-stable/:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

export GOPATH=$(go env GOPATH)

export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

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
alias wdc='watch docker-compose'

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
