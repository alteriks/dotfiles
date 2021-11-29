#archlinux specific
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/zim}

setopt NO_GLOBAL_RCS

#ZSH according to XDG
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

source ~/.config/zsh/profile
