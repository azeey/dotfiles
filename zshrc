# Path to your oh-my-zsh configuration.
export ZSH=$HOME/dotfiles/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="azeey"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode command-not-found debian extract z)

source $ZSH/oh-my-zsh.sh

setopt complete_aliases
export apt_pref="apt-get"

setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY

HISTSIZE=100000000
SAVEHIST=100000000
PATH="$PATH$HOME/bin:$HOME/.local/bin"
export PAGER="less -r"
export EDITOR="vim"

# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------
if [ $OSTYPE = "linux-gnu" ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

alias ll='ls -al'
alias l='ls -CF'
alias la='ls -al'
alias pprox='ipython --pylab --profile=prox'
alias pylab='ipython --pylab --profile=pylab'
alias minicom='minicom -o -c on'
alias g='gvim --remote-silent'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias j='jump'
alias ja='j -a'
alias jd='j -d'
alias jl='j -l'
alias jh='j -h'
alias jc='j -a $(basename $(pwd))'
alias jg='j -l | grep'
alias je='editor ~/.jumprc'

alias svd='svn diff | view -'
alias svl='svn log | view -'
alias trash=gvfs-trash
alias v='view -'
alias agr='sudo apt-get upgrade'
alias av='apt-cache show'
alias duhm='du -h --max-depth=1 | sort -h'
alias duhs='du -hs * | sort -h'
alias fn='find -name'
alias tmux='tmux -2'
alias ack='ack-grep'
#alias node='env NODE_NO_READLINE=1 rlwrap -a -A -pGreen -S "node >>> " node'
unalias ag # Silversearcher



# Key Bindings
bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char


bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "^r" history-incremental-search-backward

xp() { tmux showb | xsel -i -b }
#umask 007
autoload -U edit-command-line
zle -N edit-command-line

bindkey -M viins jj vi-cmd-mode
bindkey -M viins '\e.' insert-last-word
bindkey -M vicmd v edit-command-line

# Actel Tools
if [ -f ~/.actel_tools ]; then
    source ~/.actel_tools
fi


# Tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# ROS
if [ -x $HOME/code/catkin_ws/devel ]; then
    source $HOME/code/catkin_ws/devel/setup.zsh
    export ROS_WORKSPACE=$HOME/code/catkin_ws
fi

export VREP_ROOT_DIR=/opt/vrep

# Dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Environment setup for TinyOS

export TOSROOT="$HOME/code/tinyos-pillforge"
export TOSDIR="$TOSROOT/tos"
export CLASSPATH=$CLASSPATH:$TOSROOT/support/sdk/java/tinyos.jar:.
export MAKERULES="$TOSROOT/support/make/Makerules"
export PYTHONPATH=$PYTHONPATH:$TOSROOT/support/sdk/python

# Using Stow now
export PATH=$PATH:/opt/bin

#http://justin.abrah.ms/dotfiles/zsh.html
psgrep() {
    if [ ! -z $1 ] ; then
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

wll(){
    ll $(which $1)
}

tosdebuginit(){
    cp $HOME/code/tinyos-pillforge/tos/chips/msp430/99_gdb/gdb_x5  .gdb_x5
    cp $HOME/code/tinyos-pillforge/tos/chips/msp430/99_gdb/gdbinit .gdbinit
}


[[ -s /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]] && source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# Set terminal to use 256 colors
export TERM=xterm-256color
