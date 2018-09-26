# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

HISTFILE=~/.zsh_history

# Make sure to use double quotes to prevent shell expansion
zplug "rupa/z"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "mafredri/zsh-async"
#zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "denysdovhan/spaceship-prompt"

SPACESHIP_CHAR_SYMBOL=" "

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

bindkey '^[[A'  history-substring-search-up
bindkey '^[[B'  history-substring-search-down

