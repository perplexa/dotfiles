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
if [ -x `whence -p gdircolors` ]; then alias dircolors='gdircolors'; fi
eval `dircolors --sh ~/.gruvbox.dircolors`

# enable ls colors for zsh completion
if [ -x `whence -p gls` ]; then alias ls='gls --color=auto'; fi
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# osx md5sum fallback
if [ ! -x `whence -p md5sum` ]; then alias md5sum='md5 -r'; fi

# create vim swap and undodir if they do not exist
[ ! -d ~/.vim/swap ] && mkdir ~/.vim/swap
[ ! -d ~/.vim/undodir ] && mkdir ~/.vim/undodir

# disable python virtualenv prompt
# export VIRTUAL_ENV_DISABLE_PROMPT=1

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.zsh.inc ]; then source ~/google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f ~/google-cloud-sdk/completion.zsh.inc ]; then source ~/google-cloud-sdk/completion.zsh.inc; fi

# kubectl aliases
if [ -x `whence -p kubectl` ]; then source <(kubectl completion zsh); fi
if [ -f ~/.kube/aliases-dev ]; then source ~/.kube/aliases-dev; fi
if [ -f ~/.kube/aliases-stg ]; then source ~/.kube/aliases-stg; fi
if [ -f ~/.kube/aliases-live ]; then source ~/.kube/aliases-live; fi
