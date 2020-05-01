#!/usr/bin/env zsh
#
# Based on https://github.com/andrewferrier/fzf-z/blob/master/fzf-z.plugin.zsh
# (MIT licensed, as of 2018-12-27).
#
command -v tree >/dev/null 2>&1
if [ $? -eq 0 ]; then
    PREVIEW_COMMAND='tree -L 2 -x --noreport --dirsfirst {}'
else
    PREVIEW_COMMAND='ls -1 -R {}'
fi

if [[ $OSTYPE == darwin* ]]; then
    REVERSER='tail -r'
else
    REVERSER='tac'
fi

FZFCOLCON_EXCLUDE_PATTERN=${FZFCOLCON_EXCLUDE_PATTERN:="\/.hg"}
FZFCOLCON_EXTRA_OPTS=${FZFCOLCON_EXTRA_OPTS:=""}
FZFCOLCON_UNIQUIFIER="awk '!seen[\$0]++'"

FIND_PREFIX="find "
FIND_POSTFIX=" -type d"

__fzf_find_colcon_root_dir(){
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
__fzfcolcon() {
    if (($+FZFZ_EXCLUDE_PATTERN)); then
        EXCLUDER="egrep -v '$FZFZ_EXCLUDE_PATTERN'"
    else
        EXCLUDER="cat"
    fi

    # EXCLUDER is applied directly only to searches that need it (i.e. not
    # `z`). That improvements performance, and makes sure that the
    # FZFZ_SUBDIR_LIMIT is applied on the post-excluded list.

    FZFCOLCON_SUBDIR_LIMIT=${FZFCOLCON_SUBDIR_LIMIT:=50}

    ROOTDIR="$(__fzf_find_colcon_root_dir)"
    REMOVE_FIRST="tail -n +2"
    LIMIT_LENGTH="head -n $(($FZFCOLCON_SUBDIR_LIMIT+1))"

    SUBDIRS="{ $FIND_PREFIX $ROOTDIR/src $FIND_POSTFIX | $EXCLUDER }"
    PKGS=($(colcon list -n --base-path $ROOTDIR))
    COLCONDIRS=(build install)
    EXTRADIRS='{ print -l $ROOTDIR/${^COLCONDIRS}/${^PKGS} }'
    eval $EXTRADIRS

    FZF_COMMAND="fzf --height ${FZF_TMUX_HEIGHT:-40%} --tiebreak=end,index -m --preview='$PREVIEW_COMMAND | head -\$LINES'"

    local COMMAND="{ $EXTRADIRS } | $FZF_COMMAND"

    eval "$COMMAND" | while read item; do
        printf '%q ' "$item"
    done
    echo
}

__fzfcolcontargets() {
    ROOTDIR="$(__fzf_find_colcon_root_dir)"
    PKGS=($(colcon list -n --base-path $ROOTDIR))
    TARGETDIRS=(src build install)
    COLCONTOPDIRS='{ print -l $ROOTDIR/${^TARGETDIRS} }'
    COLCONPKGDIRS='{ print -l $ROOTDIR/${^TARGETDIRS}/${^PKGS} }'

    RECENTLY_USED_DIRS="{ z -l $ROOTDIR/ | $REVERSER | sed 's/^[[:digit:].]*[[:space:]]*//' }"
    FZF_COMMAND="fzf --height ${FZF_TMUX_HEIGHT:-40%} --tiebreak=end,index -m"

    local COMMAND="{ $COLCONTOPDIRS; $COLCONPKGDIRS; $RECENTLY_USED_DIRS; } | $FZFCOLCON_UNIQUIFIER | $FZF_COMMAND"

    eval "$COMMAND" | while read item; do
        printf '%q ' "$item"
    done
    echo
}

fzf-colcon-dir-widget() {
    LBUFFER="${LBUFFER}$(__fzfcolcontargets)"
    local ret=$?
    zle redisplay
    typeset -f zle-line-init >/dev/null && zle zle-line-init
    return $ret
}

