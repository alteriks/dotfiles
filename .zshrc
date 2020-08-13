
#setopt nocorrectall
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export QT_QPA_PLATFORMTHEME=qt5ct
#export VAGRANT_DEFAULT_PROVIDER=virtualbox
#
#https://deductivelabs.com/en/using-true-color-vim-tmux/
#export TERM="xterm-256color"
#export TERM="screen-256color" ### Fucks nvim on pwsh

#tmuxinator
#export DISABLE_AUTO_TITLE=true

#Disable Ctrl-S and Ctrl-Q on terminal
stty stop ''
stty start ''
stty -ixon
stty -ixoff

export EDITOR=vim
# BEGIN archlinux
export EDITOR=nvim
alias cat="bat -pp"
alias todo="todo.sh -d $HOME/.config/todo/todo.cfg"
alias todotxt-machine="todotxt-machine --config ~/.config/todo/todotxt-machinerc"
alias vi=nvim
alias vim=nvim
alias bc='bc -l'
alias ag='ag --hidden --ignore \.git'
alias vimdiff='nvim -d'
# END archlinux
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/oh-my-zsh

ZSH_CUSTOM=$HOME/.config/oh-my-zsh_custom
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alteriks"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

ZSH_TMUX_FIXTERM_WITH_256COLOR="screen-256color"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
#TODO: dircycle  Ctrl+Shift+Left/Right wit konsole/yakuake (moving tab)
#TODO: dirhistory
#TODO: install tmuxinator https://github.com/tmuxinator/tmuxinator
#TODO: fasd https://github.com/clvv/fasd
#plugins=(dircycle fasd git history-substring-search systemd taskwarrior tmux tmuxinator web-search)
#plugins=(dircycle fasd fancy-ctrl-z git history-substring-search safe-paste systemd taskwarrior tmux web-search)
plugins=(dircycle fasd fancy-ctrl-z git history-substring-search safe-paste systemd web-search)
alias pushd=' pushd'
alias cls='clear && echo -en "[3J"'


DEFAULT_USER="alteriks"
#if [[ $UID -eq 1001 || $UID -eq 1000 ]]; then
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false
#fi
HIST_IGNORE_SPACE=0


# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.gem/ruby/2.5.0/bin
# export MANPATH="/usr/local/man:$MANPATH"

#homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias windows="rdesktop -r disk:local=/home/kdajka -u dajka_krzy_ext -d GIGA -k pl -g 1920x1172 10.3.102.19"

bindkey "[[1;5D" backward-word
bindkey "[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
#for tmux
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OD" backward-word
bindkey "^[OC" forward-word

#ssh() {
#    if [[ -n $TMUX ]]; then
#    #if [[ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" =~ "tmux" ]]; then
#        tmux rename-window "$(if [ $# = 1 ]; then echo $1; else echo $* | egrep -o '(\w+@)?\w+\.(\w|\.)+'; fi )"
#        command ssh "$@"
#        tmux set-window-option automatic-rename "on" 1>/dev/null
#    else
#        command ssh "$@"
#    fi
#}

if [[ -n $TMUX ]]; then
  panewrap () { 
    DDD=$1
    if [[ "$DDD" =~ ^ssh\  ]]; then
      echo ZZZZZ $DDD
      DDD=$( echo $DDD| egrep -o '\w+(\.(\w|\.)+)?')
      echo BBBBBB $DDD
    else
      DDD=${DDD/ */}
    fi
    printf "\033]2;%s\033\\" "${DDD}"; 
    tmux rename-window -t . "$(tmux list-panes -t . -F '#T' | tr '\n' '+')"; 
  }
  # don't show  frequent cmd: ls|cd|which
  preexec_functions+=( panewrap )

fi

#https://wiki.archlinux.org/index.php/Systemd/User#Kill_user_processes_on_logout
tmux () {
  if [[ $# == 0 ]]; then
    systemd-run --scope --user tmux 
  else
    /usr/bin/tmux $@
  fi
}

export PAGER=less
export BAT_PAGER="less -R"
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging=always'"
# Color man pages
# export LESS_TERMCAP_mb=$'\E[01;32m'
# export LESS_TERMCAP_md=$'\E[01;32m'
# export LESS_TERMCAP_me=$'\E[0m'
# export LESS_TERMCAP_se=$'\E[0m'
# export LESS_TERMCAP_so=$'\E[01;47;34m'
# export	LESS_TERMCAP_so=$'\E[30;41m' \
# export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_us=$'\E[01;36m'
# export LESS=-r

# hack for HOME/END in neovim in tmux using kitty
if [[ $TERMINFO == /usr/lib/kitty/terminfo ]]; then
	unset TERMINFO
fi
# Kubernetes workshop
#source <(kubectl completion zsh)

#source ~/.zplug/init.zsh
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'
#zplug "changyuheng/fz", defer:1
#zplug "rupa/z", use:z.sh

# Archlinux fzf path
#https://github.com/rupa/z
if [[ -e ~/bin/z.sh ]];then
  source ~/bin/z.sh
fi

#if [[ -d /usr/share/fzf/ ]];then
#  source /usr/share/fzf/key-bindings.zsh
#  source /usr/share/fzf/completion.zsh
#fi

# ZSH VIM MODE
if [[ -e ~/.config/zsh-vim-mode/zsh-vim-mode.plugin.zsh ]]; then
  source ~/.config/zsh-vim-mode/zsh-vim-mode.plugin.zsh; 
  export KEYTIMEOUT=4
  export MODE_CURSOR_VIINS="#ffffff blinking bar"
  export MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
  export MODE_CURSOR_VICMD="white block"
  export MODE_CURSOR_SEARCH="#ff00ff steady underline"
  export MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
  export MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
fi

# FZF managed by vimplug
# Has to be loaded after zsh-vim-mode, so ctrl+r uses fzf magic
setopt no_share_history
if [[ -e ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
  alias fzfp=fzf --preview '(bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'
fi


# broot --install
source $HOME/.config/broot/launcher/bash/br

# smartcase tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
