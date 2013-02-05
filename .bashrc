#!/bin/bash
#*****************************************************************
# Copyright (c) 2009  Larence Livermore National Security (LLNS)
# All rights reserved.
#*****************************************************************
#
#  Organization: Lawrence Livermore National Lab (LLNL)
#   Directorate: Computation
#    Department: Computing Applications and Research
#      Division: S&T Global Security
#        Matrix: Atmospheric, Earth and Energy Division
#       Program: PCMDI
#       Project: Earth Systems Grid
#  First Author: Gavin M. Bell (gavin@llnl.gov)
#
#   Description:
#
#*****************************************************************

[ -z "$PS1" ] && return

shopt -s extglob
shopt -s dotglob
shopt -s cdspell
shopt -s histappend
shopt -s checkwinsize

set -o emacs
#set -o ignoreeof
export IGNOREEOF=1

set show-all-if-ambiguous on                                                    
set visible-stats on 

export LC_CTYPE="en_US.UTF-8"
export HISTCONTROL=ignoredups
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export TMOUT=0

export BASH_COMPLETION=/etc/bash_completion >& /dev/null
export BASH_COMPLETION_DIR=/etc/bash_completion.d >& /dev/null
source $BASH_COMPLETION >& /dev/null
source $BASH_COMPLETION_DIR/* >& /dev/null
export PATH=.:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/sw/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/X11R6/bin:/usr/texbin
#export PATH=.:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/sw/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/X11R6/bin:'/Library/Application Support/VMware Fusion'
export LANG="C"

export EDITOR='emacs'
export TERM="xterm-color"
export CLICOLOR="true"
#export LSCOLORS=exfxcxdxbxegedabagacad
 export LSCOLORS=dxgxcxdxbxcgcdabagacad
#export LSCOLORS="no=00:fi=00:di=34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;31:*.tar=01;*.class=01;22;*.jar=46;01:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:"

export GREP_OPTIONS='--color=auto' GREP_COLOR='00;38;5;226'

export TEMP="/tmp/`whoami`"
export TMP=${TEMP}
mkdir -p ${TEMP}

export PROJECT=${HOME}/projects
export DEVTOOLS=${HOME}/devtools

export CDPATH=.:..:$HOME/:$PROJECT/

#-------------------------------------------
echo 
echo "You are logged into a `uname -s` Machine...(Version `uname -r`)"
    sw_vers
echo "Host => `uname -n`"
printf "
                  _           _           
                 | |         | |          
  _ __ ___   __ _| | ___ ___ | |_ __ ___  
 | \'_ \` _ \ / _\` | |/ __/ _ \| | \'_ \` _ \ 
 | | | | | | (_| | | (_| (_) | | | | | | |
 |_| |_| |_|\__,_|_|\___\___/|_|_| |_| |_|
                                          
"
echo
echo " Hardware: `uname -m`...."
echo " Using Emacs Bindings..."
uptime
echo 
#fortune
#echo 

source ~/.git_bashrc
#-------------------------------------------
case "$TERM" in
    xterm | xterm-color)
	PS1='${debian_chroot:+($debian_chroot)}\[\033[00;33m\]\u@\h\[\033[00m\]:[\033[00;31m\]\W\[\033[00m\]]$(__git_ps1 ":[\033[00;32m\]%s$(git_prompt_info)\033[00m\]]"):[\!]> '
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007";history -a'
	;;
    *)
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:[\W]:[\!]> '
	;;
esac
#-----------------------------

export ESGF_SITE_ROOT=$PROJECT/esgf-site

#System-wide resources....
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export ANT_HOME=/usr/share/ant
export M2_HOME=/usr/local/maven

#Account scope resources
export CATALINA_HOME=$DEVTOOLS/tomcat
export TOMCAT_HOME=$CATALINA_HOME
export AXIS_HOME=$DEVTOOLS/axis
export JAXB_HOME=$DEVTOOLS/jwsdp/jaxb
export GROOVY_HOME=$DEVTOOLS/groovy
export JRUBY_HOME=$DEVTOOLS/jruby

export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$GROOVY_HOME/bin:$JRUBY_HOME/bin

export CLASS_ROOT=$HOME/classes
export JAR_PATH=$HOME/classes/jars
#export JAR_PATH=$HOME/projects/esg-node/lib

export CLASSPATH=.:$CLASS_ROOT:$(find $JAR_PATH | xargs | perl -pe 's/ /:/g')

#-----------------------------
source ~/.bash_aliases
source ~/.bash_functions
#-----------------------------
complete -o default -o nospace -F _git_checkout gci
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_checkout gls

export PYTHONSTARTUP=~/.pythonrc

export MARTIN_VM='/Users/bell51/Documents/Virtual Machines.localized/ESG Ubuntu 64-bit.vmwarevm/ESG Ubuntu 64-bit.vmx'