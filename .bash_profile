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
