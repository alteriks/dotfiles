#archlinux specific

# sometimes it would eval to ~/, but later it could eval to ~/.config/zsh/zim
# : ${ZIM_HOME=${ZDOTDIR:-${HOME}}/zim}

setopt NO_GLOBAL_RCS

#ZSH according to XDG
export ZDOTDIR=$HOME/.config/zsh
# export HISTFILE="$XDG_DATA_HOME"/zsh/history

source ~/.config/zsh/profile
