# perplexa.zsh-theme

case "$TERM" in
xterm* | screen*)
    arrow=$'\ue0b0'
    git_icon=$'\ue0a0'
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        if [ `hostname` = "arcam" ]; then
            emoji=$'\xf0\x9f\x94\x88 ' # speaker
        else
            emoji=$'\xe2\x98\x81\xef\xb8\x8f ' # cloud
        fi
    else
        emoji=$'\xf0\x9f\x91\xbe ' # space invader!
    fi
    ;;
*)
    arrow=">"
    git_icon="git"
    emoji="\xe2\x98\x81"
    ;;
esac

# the unchanging reality amidst and beyond the world
aum=$'\xe0\xa4\x93\xe0\xa4\xae\xe0\xa5\x8d'

# Color defines
black=000
#orange=166
#purple=135
#white=255
#turquoise=81
#hot_pink=161
#lime_green=118

# Solarized color defines from https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
base03=234
base02=235
base01=240
base00=241
base0=244
base1=245
base2=254
base3=230
yellow=136
orange=166
red=124
magenta=125
violet=61
blue=33
deep_blue=25
cyan=37
green=64
brown=94

# zsh
ZSH_THEME_GIT_PROMPT_PREFIX=" ${git_icon} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}✚%F{black}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{blue}✹%F{black}"
ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}✖%F{black}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{yellow}✭%F{black}"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"

# Style information
user_section_color_bar=${base02}
user_section_color_text=${base0}

if [ "$UID" -eq 0 ]; then
  user_section_color_bar=${base02}
  user_section_color_text=${orange}
fi

#path_section_color_bar=${green}
path_section_color_bar=${green}
path_section_color_text=${base03}

#git_section_color_bar=${cyan}
git_section_color_bar=${base02}
git_section_color_text=${base0}

# Color markup
user_section_markup_bar=%F{${user_section_color_text}}%K{${user_section_color_bar}}
user_section_markup_arrow=%F{${user_section_color_bar}}%K{${path_section_color_bar}}

path_section_markup_bar=%F{${path_section_color_text}}%K{${path_section_color_bar}}
path_section_markup_arrow=%F{${path_section_color_bar}}%K{${git_section_color_bar}}

git_section_markup_bar=%F{${git_section_color_text}}%K{${git_section_color_bar}}
git_section_markup_arrow=%F{${git_section_color_bar}}%k

# section content assignment
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  user_section_content="${emoji} %n@%m"
elif [ "$USER" = "perplexa" ]; then
  user_section_content="${emoji} ${aum}"
else
  user_section_content="${emoji} %n"
fi
#path_section_content="%d"
path_section_content="%1~"
git_section_content=$'$(git_prompt_info)$(git_prompt_status)'

# Section templates
user_section="${user_section_markup_bar} ${user_section_content} ${user_section_markup_arrow}${arrow}"
path_section="${path_section_markup_bar} ${path_section_content} ${path_section_markup_arrow}${arrow}"
git_section="${git_section_markup_bar} ${git_section_content} ${git_section_markup_arrow}${arrow}"
reset_colors="%k%f"

# Final prompt compilation

precmd() { print -rP "${user_section}${path_section}${git_section}${reset_colors}" }
PROMPT="%F{green}\$${reset_colors} "

