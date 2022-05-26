export ZSH="$HOME/.oh-my-zsh"
path+=('usr/local/go/bin')
path+=('~/.npm-global/bin')
export PATH

# theme
ZSH_THEME="gallois"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# user configuration
alias zshrc="nvim ~/.zshrc"
alias nvimconfig="cd $HOME/.config/nvim"
alias kittyconf="cd $HOME/.config/kitty && nvim ."

function mcd() {
    mkdir $1 && cd $1
}

