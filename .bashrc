# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# MacPorts Installer addition on 2017-08-23_at_11:32:12: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=$PATH:$HOME/driveai/infra/docker/offboard
export DRIVEAI_ROOT=$HOME/driveai
export PYTHONPATH="$PYTHONPATH:$DRIVEAI_ROOT"
export DOCKER_HOME=$HOME

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias la='ls -A'

alias sb='source ~/.bash_profile'
alias eb='vim ~/.bash_profile'

# adds working directory to prompt
# PS1='\u@\h:\w\$ '
# https://www.reddit.com/r/programming/comments/697cu/bash_users_what_do_you_have_for_your_ps1/
# smiley () { echo -e ":\\$(($??50:51))"; }
# export PS1="\h\$(smiley) \e[30;1m\w\e[0m\n\$ "

if [ -f /.dockerenv ]; then
  # export PS1="[\]appname@\\h$:\\w]#\[$(tput sgr0) \]"
  export PS1="\[$(tput setaf 3)$(tput bold)\h \e[30;1m\w\e[0m\n\$ "
else
  export PS1="\h \e[30;1m\w\e[0m\n\$ "
fi

# git autocomplete https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
# source ~/git-completion.bash

# drive.ai shortcuts
alias dpull='docker pull docker.drive.ai/offboard'
# alias dcmake_debug='dai_cmake_configure_debug ..' # run from ~/driveai/build
# alias dcmake_release='dai_cmake_configure_release ..' # run from ~/driveai/build
alias dcmake_debug='cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..' # run from ~/driveai/build
alias dcmake_release='cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..' # run from ~/driveai/build
# alias dcmake_debug='cmake -DCMAKE_BUILD_TYPE=Debug -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..' # run from ~/driveai/build
# alias dcmake_release='cmake -DCMAKE_BUILD_TYPE=Release -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..' # run from ~/driveai/build

# gperftool shortcuts
alias pprof='google-pprof'

# bash vim
set -o vi

alias mp='cd ~/driveai/onboard/motion_planning'
alias mpn='cd ~/driveai/jus/ros/src/mpc/src'
alias mpb='cd ~/driveai/build/onboard/motion_planning'

alias offboard='infra/docker/offboard/dai -sX --image=docker.drive.ai/offboard'
alias onboard='infra/docker/offboard/dai -sX --image=docker.drive.ai/onboard'

# Gurobi license
export GUROBI_HOME="/usr/local/gurobi751/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE=/opt/gurobi/gurobi.lic

# MOSEK
export MOSEK_HOME="$HOME/mosek/8/tools/platform/linux64x86"
export PATH="${PATH}:${MOSEK_HOME}/bin"

# TrajOpt Debug
export TRAJOPT_LOG_THRESH="ERROR"
# export TRAJOPT_CONVEX_SOLVER="GUROBI"
export TRAJOPT_CONVEX_SOLVER="BPMPD"
# export TRAJOPT_CONVEX_SOLVER="MOSEK"

# driveai ROS
source ~/driveai/jus/ros/devel/setup.bash

# make vim default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# ssh shortcuts
alias chia1='ssh -Y driveai@chia1.drive.ai'
alias chanel6='ssh -Y christopher@chanel6.drive.ai'

# autojump
. /usr/share/autojump/autojump.bash
