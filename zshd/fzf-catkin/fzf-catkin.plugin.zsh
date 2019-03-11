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

FZFCATKIN_EXCLUDE_PATTERN=${FZFCATKIN_EXCLUDE_PATTERN:="\/.hg"}
FZFCATKIN_EXTRA_OPTS=${FZFCATKIN_EXTRA_OPTS:=""}
FZFCATKIN_UNIQUIFIER="awk '!seen[\$0]++'"

FIND_PREFIX="find "
FIND_POSTFIX=" -type d"

__fzfcatkin() {
    if (($+FZFZ_EXCLUDE_PATTERN)); then
        EXCLUDER="egrep -v '$FZFZ_EXCLUDE_PATTERN'"
    else
        EXCLUDER="cat"
    fi

    # EXCLUDER is applied directly only to searches that need it (i.e. not
    # `z`). That improvements performance, and makes sure that the
    # FZFZ_SUBDIR_LIMIT is applied on the post-excluded list.

    FZFCATKIN_SUBDIR_LIMIT=${FZFCATKIN_SUBDIR_LIMIT:=50}

    ROOTDIR="$(catkin locate)"
    REMOVE_FIRST="tail -n +2"
    LIMIT_LENGTH="head -n $(($FZFCATKIN_SUBDIR_LIMIT+1))"

    SUBDIRS="{ $FIND_PREFIX $ROOTDIR/src $FIND_POSTFIX | $EXCLUDER }"
    PKGS=($(catkin list -u))
    CATKINDIRS=(build devel install)
    EXTRADIRS='{ print -l $ROOTDIR/${^CATKINDIRS}/${^PKGS} }'
    eval $EXTRADIRS

    FZF_COMMAND="fzf --height ${FZF_TMUX_HEIGHT:-40%} --tiebreak=end,index -m --preview='$PREVIEW_COMMAND | head -\$LINES'"

    local COMMAND="{ $EXTRADIRS } | $FZF_COMMAND"

    eval "$COMMAND" | while read item; do
        printf '%q ' "$item"
    done
    echo
}

__fzfcatkintargets() {
    ROOTDIR="$(catkin locate)"
    PKGS=($(catkin list -u))
    TARGETDIRS=(src build devel)
    CATKINTOPDIRS='{ print -l $ROOTDIR/${^TARGETDIRS} }'
    CATKINPKGDIRS='{ print -l $ROOTDIR/${^TARGETDIRS}/${^PKGS} }'

    RECENTLY_USED_DIRS="{ z -l $ROOTDIR/ | $REVERSER | sed 's/^[[:digit:].]*[[:space:]]*//' }"
    FZF_COMMAND="fzf --height ${FZF_TMUX_HEIGHT:-40%} --tiebreak=end,index -m"

    local COMMAND="{ $CATKINTOPDIRS; $CATKINPKGDIRS; $RECENTLY_USED_DIRS; } | $FZFCATKIN_UNIQUIFIER | $FZF_COMMAND"

    eval "$COMMAND" | while read item; do
        printf '%q ' "$item"
    done
    echo
}

fzf-catkin-dir-widget() {
    LBUFFER="${LBUFFER}$(__fzfcatkintargets)"
    local ret=$?
    zle redisplay
    typeset -f zle-line-init >/dev/null && zle zle-line-init
    return $ret
}

zle -N fzf-catkin-dir-widget
bindkey -M viins -r '^B'
bindkey -M vicmd -r '^B'
bindkey -M emacs -r '^B'

bindkey -M viins '^B' fzf-catkin-dir-widget
bindkey -M vicmd '^B' fzf-catkin-dir-widget
bindkey -M emacs '^B' fzf-catkin-dir-widget

