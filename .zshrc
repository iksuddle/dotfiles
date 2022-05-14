source $HOME/scripts/antigen.zsh
export PATH=~/.npm-global/bin:$PATH

PROMPT='[%n|%1~]%F{magenta}%B$%b%f '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/iksuddle/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias zshrc='nvim ~/.zshrc'
alias nvimconfig='cd ~/.config/nvim/'

function mcd() {
    mkdir $1 && cd $1
}

