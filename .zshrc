# Locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add additional directories to the path.
pathadd() {
  [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="$1${PATH:+":$PATH"}"
}

pathadd ~/dotfiles/bin

# Load perplexa's environment shizzle
source ~/.environment.ppx

# oh-my-zsh
DISABLE_AUTO_UPDATE='true'
COMPLETION_WAITING_DOTS='true'
ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.zsh-custom
ZSH_THEME=perplexa
plugins=(git svn themes vagrant perl python brew zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# use gnu dircolors
if [[ -x `whence -p gdircolors` ]];
  then alias dircolors='gdircolors'
fi
eval `dircolors ~/.dir_colors`

# enable ls colors for zsh completion
if [[ -x `whence -p gls` ]];
  then alias ls='gls --color=auto'
fi
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# old php aliases
alias start_helios='screen -dmSADRU helios VBoxHeadless --startvm helios &'
alias xdbg_tunnel='ssh -vvv -N -g -R 9000:127.0.0.1:9000 helios.local' # then http://url?XDEBUG_SESSION_START=perplexa
alias xphp='PHP_IDE_CONFIG="serverName=trunk.localhost" XDEBUG_CONFIG="idekey=XDEBUG_PHPSTORM" php'

# dev aliases
alias gensslcert='openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem'
alias pp-nlbr='pbpaste | sed -e $'\''s/\{lnbr\}/\\\n/g'\'''

# osx aliases
alias fixfinder='defaults write com.apple.Finder AppleShowAllFiles YES'
alias fixlauncher='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -seed'
if [[ ! -x `whence -p md5sum` ]]; then
  alias md5sum='md5 -r'
fi

# rebuild icon cache
rebuild-icons() {
  sudo find /private/var/folders/ -name com.apple.dock.iconcache -print0 | xargs -0 rm -rf
  sudo find /private/var/folders/ -name com.apple.iconservices -print0 | xargs -0 rm -rf
  sudo rm -rf /Library/Caches/com.apple.iconservices.store
  killall Finder
  killall Dock
}

# network
alias ips='ifconfig -a | perl -nle '\''/(\d+\.\d+\.\d+\.\d+)/ && print $1'\'''
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Imgur upload. API key: http://imgur.com/register/api_anon
imgur() { curl -F "image=@$1" -H "Authorization: Client-ID ${IMGUR_API_TOKEN}" https://api.imgur.com/3/image | sed 's/\\//g' | egrep -o 'http:[^"]+' | tee >(pbcopy); }

# screen shortcuts
screenify() { screen -dmSADRU $1 $@; }
alias irssi='screenify irssi'
alias rtorrent='screenify rtorrent'

# tmux
tmuxify() { tmux attach-session -t $1 2>/dev/null || tmux new-session -s $1 "$@" }

# aliases
alias i='irssi'
alias p='ssh -p ${PPX_SERVER_PORT} ${PPX_SERVER_HOST}'
alias rand-pwd='LC_ALL=C tr -cd a-zA-Z0-9 < /dev/urandom | fold -w 32 | head -n 1'

# <3
alias scp-resume='rsync --partial --progress --rsh=ssh'

# oooh!
alias s42='cd ${S42_HOME}'
alias s42-gw='ssh-add && ssh -A ${S42_GW_UID}'

