# oh-my-zsh
DISABLE_AUTO_UPDATE='true'
COMPLETION_WAITING_DOTS='true'
ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.zsh-custom
ZSH_THEME=theunraveler
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
plugins=(
  aws brew colorize cp git golang helm kubectl nmap perl python rust
  rsync sudo terraform themes torrent vagrant zsh-syntax-highlighting
)

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

# allow GPG to send passsword prompts
export GPG_TTY=$(tty)

# homebrew
export HOMEBREW_NO_ANALYTICS=1

# kubectl aliases
for kube_aliases in ~/.kube/aliases-*(N); do source "${kube_aliases}"; done
