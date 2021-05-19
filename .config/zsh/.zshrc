# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HOSTNAME=$(hostname)

# https://github.com/romkatv/powerlevel10k#extra-space-without-background-on-the-right-side-of-right-prompt
ZLE_RPROMPT_INDENT=0

source ${XDG_CONFIG_HOME}/zsh/aliases
source ${XDG_CONFIG_HOME}/zsh/functions
if [[ -e ${XDG_CONFIG_HOME}/zsh/privyzsh ]]; then
  source ${XDG_CONFIG_HOME}/zsh/privyzsh
fi

# https://github.com/zfsonlinux/grub/issues/5#issuecomment-325221448
export ZPOOL_VDEV_NAME_PATH=YES

export LSB_RELEASE=$(lsb_release -is)
if [[ "${LSB_RELEASE}" == 'ManjaroLinux' || "${LSB_RELEASE}" == 'ArchLinux' ]]; then
  source ~/.config/zsh/archlinux
elif [[ "${LSB_RELEASE}" == 'Ubuntu' ]]; then
  source ~/.config/zsh/ubuntu
fi
# Disable globbing for URL arguments
# https://superuser.com/questions/982110/how-can-i-disable-globbing-for-url-arguments-in-zsh
# maybe function? 'noglob youtube-dl url?foo=bar' OR https://superuser.com/questions/649635/zsh-says-no-matches-found-when-trying-to-download-video-with-youtube-dl/1237124#1237124
setopt NO_NOMATCH

#Disable Ctrl-S and Ctrl-Q on terminal, only on interactive shells
if [[ -t 0 && $- = *i* ]]
then
  stty stop ''
  stty start ''
  stty -ixon
  stty -ixoff
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/ohmyzsh

ZSH_CUSTOM=${ZSH}_custom
#ZSH_THEME="alteriks"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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

plugins=(dircycle git git-prompt history-substring-search safe-paste systemd web-search)

DEFAULT_USER="alteriks"
#if [[ $UID -eq 1001 || $UID -eq 1000 ]]; then
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOQUIT=false
#fi
HIST_IGNORE_SPACE=0

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sdm:$PATH

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
export HISTFILE=$XDG_DATA_HOME/zsh/history_$HOSTNAME
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

# broot --install
if [[ -e $HOME/.config/broot/launcher/bash/br ]]; then
  source $HOME/.config/broot/launcher/bash/br
fi

if [[ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  typeset -A ZSH_HIGHLIGHT_STYLES # In case it doesn't exist above.
ZSH_HIGHLIGHT_STYLES=()
  ZSH_HIGHLIGHT_STYLES[comment]='none'
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  
  # https://github.com/zsh-users/zsh-syntax-highlighting/issues/295
  # Remove sloowness when using with ohmyzsh
  zstyle ':bracketed-paste-magic' active-widgets '.self-*'
fi

# smartcase tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# TODO
# rg 'word1|word2|wordN'
# if file matches loop over and match words
function rgsearch() { rg -C 5 $1 |rg $2 }

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
