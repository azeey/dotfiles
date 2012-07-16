    # Path to your oh-my-zsh configuration.
export ZSH=$HOME/dotfiles/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="azeey"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode command-not-found deb debian)

source $ZSH/oh-my-zsh.sh
unsetopt complete_aliases

setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY

HISTSIZE=100000000
SAVEHIST=100000000
PATH="$PATH:/usr/local/flex_sdk_3/bin/:/usr/local/gnuarm/bin:/var/lib/gems/1.8/bin:/var/lib/gems/1.9.1/bin:/home/addisu/bin:/opt/drbl/sbin:/opt/drbl/bin:/usr/local/cuda/bin:/usr/local/x-tools/i586-ciholas-linux-gnu/bin"
export PAGER="less -r"
export EDITOR="vim"

# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------
alias ls='ls -G --color=auto'
alias ll='ls -al'
alias l='ls -CF'
alias la='ls -al'
alias pprox='ipython --pylab --profile=prox'
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
alias acs='apt-cache search'
alias duhm='du -h --max-depth=1'
alias fn='find -name'

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

x() { tmux showb | xclip -selection c. }
source `jump-bin --zsh-integration`
umask 007
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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
