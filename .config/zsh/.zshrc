
#setopt nocorrectall
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
alias ag='ag --hidden --ignore \.git'
alias bc='bc -l'
alias cat="bat -pp"
alias curl_zt="curl -x socks5h://localhost:5555"
alias rg="rg --smart-case"
alias step="step-cli"
alias sysyadm="sudo yadm --yadm-data /etc/yadm"
alias todo="todo.sh -d $HOME/.config/todo/todo.cfg"
alias todotxt-machine="todotxt-machine --config ~/.config/todo/todotxt-machinerc"
alias vi=nvim
alias vim=nvim
alias vimdiff='nvim -d'
# END archlinux
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/ohmyzsh

ZSH_CUSTOM=${ZSH}_custom
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
#plugins=(dircycle fasd git history-substring-search systemd taskwarrior tmux tmuxinator web-search)
#plugins=(dircycle fasd fancy-ctrl-z git history-substring-search safe-paste systemd taskwarrior tmux web-search)
#plugins=(dircycle fasd fancy-ctrl-z git history-substring-search safe-paste systemd web-search)
plugins=(dircycle git history-substring-search safe-paste systemd web-search)
alias pushd=' pushd'
alias cls='clear && echo -en "[3J"'


DEFAULT_USER="alteriks"
#if [[ $UID -eq 1001 || $UID -eq 1000 ]]; then
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOQUIT=false
#fi
HIST_IGNORE_SPACE=0


# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.gem/ruby/2.5.0/bin
# export MANPATH="/usr/local/man:$MANPATH"

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
#
#Most servers don't know about terminal specifics (terminfo) TERM=xterm-kitty or TERM=tmux-256color
#It' easier to change it for ssh than copy all terminfo (tic)
#https://github.com/alacritty/alacritty/issues/1208#issuecomment-376697989
alias ssh='TERM=xterm-256color \ssh'

#TODO: bin/ssh_tmux_rename_window_test.sh
if [[ -n $TMUX ]]; then
  panewrap () { 
    SHELL_CMD=$1
    if [[ "$SHELL_CMD" =~ ^ssh\  ]]; then
      #echo ZZZZZ $SHELL_CMD
      SHELL_CMD=$( echo $SHELL_CMD | sed 's/^ssh//' | egrep -o '\w+(\.(\w|\.)+)?')
      #echo BBBBBB $SHELL_CMD
    else
      SHELL_CMD=${SHELL_CMD/ */}
    fi

    TMUX_LIST_PANES=$(tmux list-panes -t . -F '#T')
    printf "\033]2;%s\033\\" "${SHELL_CMD}"; 
    # awk #1 replaces newline with ＋, awk #2 strips last ＋
    tmux rename-window -t . "$(tmux list-panes -t . -F '#T' | awk -vRS="\n" -vORS=" ＋ " '1' | awk -F '＋ $' '{print $1}')"
    #tmux rename-window -t . "$(tmux list-panes -t . -F '#T' | tr '\n' '＋')"; 
  }
  # don't show  frequent cmd: ls|cd|which
  preexec_functions+=( panewrap )

fi

#https://wiki.archlinux.org/index.php/Systemd/User#Kill_user_processes_on_logout
tmux () {
  if [[ $# == 0 ]]; then
    TMUX_SESSION_COUNT=$(/usr/bin/tmux list-sessions 2>/dev/null |grep -c window)
    if [[ $TMUX_SESSION_COUNT == 0 ]]; then
      systemd-run --scope --user /usr/bin/tmux 
    elif [[ $TMUX_SESSION_COUNT == 1 ]]; then
      /usr/bin/tmux attach-session
    else
      /usr/bin/tmux list-session
    fi
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

# Kubernetes workshop
#source <(kubectl completion zsh)

#source ~/.zplug/init.zsh
#zplug 'zplug/zplug', hook-build:'zplug --self-manage'
#zplug "changyuheng/fz", defer:1
#zplug "rupa/z", use:z.sh

#https://github.com/rupa/z
if [[ -e ~/bin/z.sh ]];then
  source ~/bin/z.sh
elif [[ -e /usr/share/z/z.sh ]];then
  source /usr/share/z/z.sh
fi


# ZSH VIM MODE
if [[ -e ~/.config/zsh-vim-mode/zsh-vim-mode.plugin.zsh ]]; then
  source ~/.config/zsh-vim-mode/zsh-vim-mode.plugin.zsh; 
  export KEYTIMEOUT=15
  export MODE_CURSOR_VIINS="#ffffff blinking bar"
  export MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
  export MODE_CURSOR_VICMD="#bf00ff block"
  export MODE_CURSOR_SEARCH="#ff00ff steady underline"
  export MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
  export MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
fi


# FZF managed by vimplug
# Has to be loaded after zsh-vim-mode, so ctrl+r uses fzf magic
setopt no_share_history
setopt INC_APPEND_HISTORY_TIME
export HISTFILE=$XDG_DATA_HOME/zsh/history_$(hostname)
if [[ -d /usr/share/fzf/ ]];then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
  alias fzfp=fzf --preview '(bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -500'
  #Instead of using TAB key with a trigger sequence (**<TAB>) complete with ^T
  export FZF_COMPLETION_TRIGGER=''
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  bindkey '^T' fzf-completion
  bindkey '^I' $fzf_default_completion
fi
rga-fzf() {
  RG_PREFIX="rga --files-with-matches"
  local file
  file="$(
  FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
    fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
    --phony -q "$1" \
    --bind "change:reload:$RG_PREFIX {q}" \
    --preview-window="70%:wrap"
    )" &&
      echo "opening $file" &&
      xdg-open "$file"
}


# broot --install
if [[ -e $HOME/.config/broot/launcher/bash/br ]]; then
  source $HOME/.config/broot/launcher/bash/br
fi

if [[ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  
  # https://github.com/zsh-users/zsh-syntax-highlighting/issues/295
  # Remove sloowness when using with ohmyzsh
  zstyle ':bracketed-paste-magic' active-widgets '.self-*'
fi

# smartcase tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

timezsh() {
    shell=${1-$SHELL}
      for i in $(seq 1 10); do /usr/bin/time -p $shell -i -c exit; done
    }
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION


vagrant_prepare() {
  if [[ -z "$1" ]]; then
    echo "No argument supplied"
  else
    cd ~/Vagrant/
    mkdir -p $1
    V_TEMPLATE=${1%%[0-9]*}
    if [[ -d 00_template/${V_TEMPLATE} ]]; then
      cp 00_template/${V_TEMPLATE}/Vagrantfile $1
    else
      cp 00_template/base/Vagrantfile $1
    fi
    cd $1
    print -z vagrant up
  fi
}
vagrant_diff() {
  DIRNAME=$(basename $(pwd))
  V_TEMPLATE=${DIRNAME%%[0-9]*}
  if [[ -d ../00_template/${V_TEMPLATE} ]]; then
    echo " === ${V_TEMPLATE}/Vagrantfile <-> Vagrantfile === "
    diff ../00_template/${V_TEMPLATE}/Vagrantfile Vagrantfile
  else
    echo " === base/Vagrantfile <-> Vagrantfile === "
    diff ../00_template/base/Vagrantfile Vagrantfile
  fi
}

step-cli-ca() { step-cli ca certificate $1 $1.crt $1.key --not-after=17520h }
arpscan() {
  ARPSCAN_IP=$1
  if [[ -z $ARPSCAN_IP ]]; then
    ARPSCAN_IP=192.168.1.0/24
  fi
  sudo nmap -sP $ARPSCAN_IP | awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " => "$3;}' | sort
}
# TODO
# rg 'word1|word2|wordN'
# if file matches loop over and match words
function rgsearch() { rg -C 5 $1 |rg $2 }
function qrcode() {
  echo $1 | qrencode -t ASCII -o - | sed 's/#/█/g'
  #:w ++enc=utf-8:w ++enc=utf-8
}

# systemctl start/stop && status
function sc {
  name="${@:(2)}";
  echo "COMMAND: ${1}, NAME: ${name}";
  systemctl "${1}" ${name};
  systemctl status ${name};
}

function test_ip_port() {
  while read -r ip port; do
    if [[ -z ${port} ]]; then
      port=22
    fi
    if [[ -z ${ip} ]]; then
      echo Exiting...
      return
      # /dev/tcp/ can resolve DNS names
      # elif [[ ! $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
      #   ip=$( dig +short ${ip} )
    fi
    if timeout 4 bash -c "cat < /dev/null >/dev/tcp/${ip}/${port}"; then
      echo -e "${ip}:${port}\tSuccess"
    else
      echo -e "${ip}:${port}\tFailure"
    fi
  done < "${1:-/dev/stdin}"
}

export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc

alias vpn_my_ip="curl --socks5 127.0.0.1:1080 https://ipinfo.io/"
