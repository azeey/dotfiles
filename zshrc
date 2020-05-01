fpath=("$HOME/.zsh.d" $fpath)

source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle mercurial
antigen bundle git
antigen bundle command-not-found
antigen bundle vi-mode
antigen bundle extract
antigen bundle z
antigen bundle history-substring-search
antigen bundle tmux
antigen bundle debian
antigen bundle common-aliases

#antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Syntax highlighting bundle.
# Syntax highlighting won't work with vi-mode. Disable for now
#antigen bundle zsh-users/zsh-syntax-highlighting
#
# fzf-z
antigen bundle andrewferrier/fzf-z

# fzf-catkin
antigen bundle ~/.zsh.d/fzf-catkin --no-local-clone

# fzf-colcon
antigen bundle ~/.zsh.d/fzf-colcon --no-local-clone

# Tell antigen that you're done.
antigen apply


setopt complete_aliases
export apt_pref="apt"
setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
HISTSIZE=100000000
SAVEHIST=100000000

PATH="$PATH:$HOME/bin:$HOME/.local/bin"
export PAGER="less -r"
export EDITOR="vim"
# Pager Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green
# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------
alias pylab='ipython --pylab --profile=pylab'
alias pylab3='ipython3 --pylab --profile=pylab'
alias g='gvim --remote-silent'

alias trash=gvfs-trash
alias v='vim -R -'
alias agr='sudo apt-get upgrade'
alias av='apt-cache show'
alias duhm='du -h --max-depth=1 | sort -h'
alias duhs='du -hs * | sort -h'
alias fn='find -name'
#alias tmux='tmux -2'
alias ack='ack-grep'
alias vimdiff='vim -d'
alias ag='ag --path-to-ignore ~/.ignore'
alias gdb='gdb -q'
alias ign-gdb='gdb --args /usr/bin/ruby $(which ign)'
alias gc="git commit -v -s"


# Key Bindings
bindkey "^r" history-incremental-search-backward

xp() { tmux showb | xsel -i -b }

bindkey -M viins jj vi-cmd-mode
bindkey -M viins '\e.' insert-last-word
#bindkey -M vicmd v edit-command-line


# Tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

# ROS
if [ -x $HOME/code/catkin_ws/devel ]; then
    source $HOME/code/catkin_ws/devel/setup.zsh
    export ROS_WORKSPACE=$HOME/code/catkin_ws
fi


# Using Stow now
export PATH=$PATH:/opt/bin

# ccache
export PATH=/usr/lib/ccache:$PATH

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


[[ -s /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]] && source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

activate_anaconda(){
    export PATH="$HOME/anaconda2/bin:$PATH"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER=''
#bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

export FZFZ_EXCLUDE_PATTERN="\.(git|hg)"
export FZFZ_SUBDIR_LIMIT=10
# This makes a big difference
export FZFZ_EXTRA_OPTS="-e"

# revhgpr Branch [NOTES]
#revhgpr() {
    #if [[ ! -z $1 ]] ; then

        #if [[ ! -z $2 ]] ; then
            #hg status --rev $1 | grep -v ^\? >> $2
        #fi

        #hg status --rev $1 -n  | grep -v ^\? | xargs vim
    #else
        #echo "Need branch to diff against and path to PR review file"
    #fi
#}

# revhgpr Branch [NOTES] [hg diff command]
revhgpr() {
    if [[ ! -z $1 ]] ; then

        if [[ ! -z $2 ]] ; then
            if [[ ! -z $3 ]] ; then
                hg status --change $(echo $3 | awk '{print $NF}') | grep -v ^\? >> $2
            else
                hg diff --stat --rev "ancestor($1,.)"  >> $2
            fi
        fi

        if [[ ! -z $3 ]] ; then
            vim -c "ALEDisable | set diffopt-=iwhite | DiffReview $3"
        else
            vim -c "ALEDisable | set diffopt-=iwhite | DiffReview hg diff --rev ancestor($1,.) "
        fi
    else
        echo "Need branch to diff against and path to PR review file"
    fi
}

# Setup revhgpr to use mercurial branch completion
compdef "_hg_cmd_update -r" revhgpr
 _fzf_complete_revhgpr() {
  _fzf_complete "--no-sort" "$@" < <( { hg branches -q})
 }

revgitpr() {
    if [[ ! -z $1 ]] ; then

        if [[ ! -z $2 ]] ; then
            if [[ ! -z $3 ]] ; then
                #hg status --change $(echo $3 | awk '{print $NF}') | grep -v ^\? >> $2
            else
                git diff --name-status $1... >> $2
            fi
        fi

        if [[ ! -z $3 ]] ; then
            vim -c "ALEDisable | set diffopt-=iwhite | DiffReview $3"
        else
            vim -c "ALEDisable | set diffopt-=iwhite | DiffReview git diff $1..."
        fi
    else
        echo "Need branch to diff against and path to PR review file"
    fi
}

# Setup revgitpr to use git branch completion
#compdef "_hg_cmd_update -r" revhgpr
# _fzf_complete_revhgpr() {
#  _fzf_complete "--no-sort" "$@" < <( { hg branches -q})
# }


nmmangled() {
  if [[ ! -z $2 ]] ; then
    spat=$(nm -C $1 | grep $2 | cut -f1 -d ' ')
    nm $1 | grep -F $spat
  else
    nm $1
  fi
}

ign-test() {
  # get the name of project
  builddir=$(catkin locate -b)
  pkg=$(catkin list --this -u)
  pushd -q $builddir/$pkg
  make test
  popd -q
  #catkin build --this -iv --no-deps --make-args test
}

ign-source() {
  source $(catkin locate -d)/setup.zsh
}

gencatkincompdb() {
# This assumes the compile_commands.json has already been generated in the build directory
  local build_dir=$(catkin locate -b)
  local pkg=$(catkin list --this -u)
  compdb -p $build_dir/$pkg list > compile_commands.json
}

_find_colcon_root_dir(){
  # Look for build/.built_by while crawling up each directory
  local curDir=$PWD
  local rc=1;
  while true
  do
    if [[ -d "$curDir/build" && -e "$curDir/build/.built_by" ]] then
      local built_by=$(cat $curDir/build/.built_by)
      if [[ $built_by == "colcon" ]] then
        echo "$curDir"
        rc=0
        break
      fi
    elif [[ $curDir == "/" ]] then
      break
    else
      curDir=$(dirname $curDir)
    fi
  done
  return $rc
}
gencolconcompdb() {
  local curDir=$PWD
  local root_dir=$(_find_colcon_root_dir)
  if [[ $? -eq 0 ]] then
    pushd -q $root_dir
    local pkg=$(colcon list -n --paths $curDir)
    local pkg_build_dir="$root_dir/build/$pkg"
    pushd -q $pkg_build_dir
    if [[ ! -e 'compile_commands.json' ]] then
      cmake . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    fi
    compdb -p . list > $curDir/compile_commands.json
    popd -q
    popd -q
  fi
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DEBEMAIL="addisu@openrobotics.org"
export DEBFULLNAME="Addizu Z. Taddese"

zle -N fzf-catkin-dir-widget
bindkey -M viins -r '^B'
bindkey -M vicmd -r '^B'
bindkey -M emacs -r '^B'

bindkey -M viins '^B' fzf-catkin-dir-widget
bindkey -M vicmd '^B' fzf-catkin-dir-widget
bindkey -M emacs '^B' fzf-catkin-dir-widget

zle -N fzf-colcon-dir-widget
bindkey -M viins -r '^F'
bindkey -M vicmd -r '^F'
bindkey -M emacs -r '^F'

bindkey -M viins '^F' fzf-colcon-dir-widget
bindkey -M vicmd '^F' fzf-colcon-dir-widget
bindkey -M emacs '^F' fzf-colcon-dir-widget

