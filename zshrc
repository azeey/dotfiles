# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

fpath=("$HOME/.zsh.d" $fpath)

# Uncommenting this will break completion for aliases in a different way.
# When uncommented, gco will complete with files instead of branches.
#setopt complete_aliases

# Case sensitive completion
CASE_SENSITIVE=true

source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle vi-mode
antigen bundle extract
# antigen bundle z
antigen bundle history-substring-search
antigen bundle debian
antigen bundle common-aliases
antigen bundle fzf

antigen bundle zsh-users/zsh-completions

## Load the theme.
#antigen theme romkatv/powerlevel9k powerlevel9k

# antigen theme spaceship-prompt/spaceship-prompt

# fzf-z
# antigen bundle andrewferrier/fzf-z
antigen bundle ~/.zsh.d/fzf-colcon --no-local-clone

# Tell antigen that you're done.
antigen apply


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
alias ls='lsd'
alias pylab='ipython --pylab --profile=pylab'
alias pylab3='ipython3 --pylab --profile=pylab'
alias g='gvim --remote-silent'

alias trash=gvfs-trash
alias v='vim -R -'
alias agr='sudo apt-get upgrade'
alias av='apt-cache show'
alias ar="sudo $apt_pref remove"
alias duhm='du -h --max-depth=1 | sort -h'
alias duhs='du -hs * | sort -h'
alias fn='find -name'
alias ack='ack-grep'
alias vimdiff='vim -d'
alias ag='ag --path-to-ignore ~/.ignore'
alias gdb='gdb -q'
alias ign-gdb='gdb -q --args /usr/bin/ruby $(which ign)'
alias gz-gdb='gdb -q --args /usr/bin/ruby $(which gz)'
alias ign-lldb='lldb -- /usr/bin/ruby $(which ign)'
alias gz-lldb='lldb -- /usr/bin/ruby $(which gz)'
alias cgdb='cgdb -d gdb'
alias ign-cgdb='cgdb -d gdb --args /usr/bin/ruby $(which ign)'
alias ign-gdbgui='gdbgui --args /usr/bin/ruby $(which ign)'
alias ign-perf='perf record -F 99 -g -- /usr/bin/ruby $(which ign)'
alias gz-perf='perf record -F 99 -g -- /usr/bin/ruby $(which gz)'

alias gc="git commit -v -s"
alias gsw="git switch"
alias lg="lazygit"
alias lgb="lazygit branch"
alias gd="git --no-pager diff"

alias nobs='NVIM_APPNAME="nvim_obsidian" nvim'


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

eval "$(zoxide init zsh)"

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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='fdfind'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='~~'

#bindkey '^I' $fzf_default_completion
#bindkey '^I' $fzf_default_completion

export FZFZ_EXCLUDE_PATTERN="\.(git|hg)"
export FZFZ_SUBDIR_LIMIT=10
# This makes a big difference
export FZFZ_EXTRA_OPTS="-e"

#revgitpr() {
#    if [[ ! -z $1 ]] ; then

#        if [[ ! -z $2 ]] ; then
#            if [[ ! -z $3 ]] ; then
#                #hg status --change $(echo $3 | awk '{print $NF}') | grep -v ^\? >> $2
#            else
#                git diff --name-status $1... >> $2
#            fi
#        fi

#        if [[ ! -z $3 ]] ; then
#            vim -c "ALEDisable | set diffopt-=iwhite | DiffReview $3"
#        else
#            vim -c "ALEDisable | set diffopt-=iwhite | DiffReview git diff $1..."
#        fi
#    else
#        echo "Need branch to diff against and path to PR review file"
#    fi
#}

revgitpr() {
    if [[ ! -z $1 ]] ; then
        gh pr diff | lsdiff --strip 1 -s >> $1
    fi

    #$HOME/code/neovim-diff/install/bin/nvim -c "PRReviewMode| DiffReview gh pr diff"
    # vim -c "PRReviewMode| DiffReview gh pr diff"
    vim -c "DiffReview gh pr diff"
}

revgitbranch() {
    #$HOME/code/neovim-diff/install/bin/nvim -c "PRReviewMode | DiffReview git diff $1..."
    vim -c "PRReviewMode | DiffReview git diff $1..."
}

# Setup revgitpr to use git branch completion
compdef "_git_cmd_update -r" revgitbranch
 _fzf_complete_revgitbranch() {
  _fzf_complete "--no-sort" "$@" < <( { git branch -a})
 }


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
  local root_dir=$(_find_colcon_root_dir)
  if [[ $? -eq 0 ]] then
    local pkg=$(colcon --log-base /dev/null list -n --paths $PWD)
    local pkg_build_dir="$root_dir/build/$pkg"
    if [[ ! -e "$pkg_build_dir/compile_commands.json" ]] then
      cmake $pkg_build_dir -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    fi
    compdb -p $pkg_build_dir list > compile_commands.json
  fi
}

dv() {
  vi +"DiffviewOpen -uno $1"
}

dvpr() {
  dv $(gh base-branch)...HEAD
}
dvbase() {
  dv $(gh base-branch)
}

# Setup dv to use git branch completion
# compdef "_git_cmd_update -r" dv
#  _fzf_complete_dv() {
#   _fzf_complete "--no-sort" "$@" < <( { git branch -a})
#  }

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export DEBEMAIL="addisu@openrobotics.org"
export DEBFULLNAME="Addisu Z. Taddese"

zle -N fzf-colcon-dir-widget
bindkey -M viins -r '^F'
bindkey -M vicmd -r '^F'
bindkey -M emacs -r '^F'

bindkey -M viins '^F' fzf-colcon-dir-widget
bindkey -M vicmd '^F' fzf-colcon-dir-widget
bindkey -M emacs '^F' fzf-colcon-dir-widget


eval "$(starship init zsh)"

# Enable docker to autocomplete with after cli flags.
# See https://github.com/ohmyzsh/ohmyzsh/issues/9266
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

gz_last_release_version() {
  git describe --tags --abbrev=0 | sed 's/.*_//'
}

export LANG=${LANG:-"en_US.UTF-8"}
export LC_ALL=${LC_ALL:-"en_US.UTF-8"}

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

export PATH=$PATH:$HOME/.local/share/gem/ruby/3.2.0/bin


bindkey '^G' zoxide_interactive_mode
zoxide_interactive_mode() {
  zle push-input
  zle clear-screen
  zi
  zle reset-prompt
}
zle -N zoxide_interactive_mode
export PATH="$HOME/.pixi/bin:$PATH"
