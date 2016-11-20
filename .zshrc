# locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# load exports, aliases and functions
source ~/.exports
source ~/.aliases
source ~/.functions

pathadd ~/dotfiles/bin

# oh-my-zsh
DISABLE_AUTO_UPDATE='true'
COMPLETION_WAITING_DOTS='true'
ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.zsh-custom
ZSH_THEME=theunraveler
plugins=(git nmap perl python sudo themes torrent vagrant zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# bigger history
HISTSIZE=10000000
SAVEHIST=10000000

# use gnu dircolors
if [[ -x `whence -p gdircolors` ]];
  then alias dircolors='gdircolors'
fi
eval `dircolors ~/.gruvbox.dircolors`

# enable ls colors for zsh completion
if [[ -x `whence -p gls` ]];
  then alias ls='gls --color=auto'
fi
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# osx md5sum fallback
if [[ ! -x `whence -p md5sum` ]]; then
  alias md5sum='md5 -r'
fi

# disable python virtualenv prompt
# export VIRTUAL_ENV_DISABLE_PROMPT=1

