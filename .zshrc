# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
path+=("$HOME/.npm-global/bin")
export PATH

ZSH_THEME="gallois"

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias nvimconfig="cd ~/.config/nvim && nvim ."
alias kittyconf="cd ~/.config/kitty && nvim ."
alias zshrc="nvim ~/.zshrc"

function mcd() {
    mkdir $1 && cd $1
}
