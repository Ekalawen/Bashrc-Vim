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
HISTSIZE=10001
HISTFILESIZE=20002

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

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
alias ll='ls -arohF'
alias la='ls -ArohF'
alias lr='tree'
alias l='ls -CF'

alias c='cat'
alias v='gvim'
alias vp='v -p'
alias vxml="v -c ':%!xmlstarlet fo'"
alias python='python3'
PATH_PRG="$H/"
alias prg='cd $PATH_PRG'
alias gcc='gcc -Wall -pedantic'
alias g++='g++ -Wall -pedantic'
alias gccSDL='gcc -Wall -pedantic $(sdl-config --cflags --libs)'
alias g++SDL='g++ -Wall -pedantic $(sdl2-config --cflags --libs)'
alias brc='v $H/.bashrc'
alias vrc='v $H/.vimrc'
alias sourceb='source $H/.bashrc'
alias sublime='subl'

alias rm='rm -iv --preserve-root'
alias mv='mv -bv'
alias search='apt-cache search'
alias install='apt-get install'

alias g='git'
alias gs='git status'
alias gc='git checkout'
alias gm='git commit -m'
alias gmnv='git commit --no-verify -m'
alias gca='git commit --amend'
alias gl='git log --graph --color --format="%C(yellow)%h%Creset %cr %C(blue)%cn%Creset -%C(auto)%d%Creset %s" -n 10'
alias gla='git log --all --graph --color --format="%C(yellow)%h%Creset %cr %C(blue)%cn%Creset -%C(auto)%d%Creset %s"'
alias glaa='git log --all --graph --color --name-status --format="%C(yellow)%h%Creset %cr %C(blue)%cn%Creset -%C(auto)%d%Creset %s"'
alias ga='git add'
alias gap='ga -p'
alias gae='ga .'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdl='git diff HEAD~1'
alias gdw='git diff --color-words'
alias gdcw='git diff --cached --color-words'
alias gdlw='git diff HEAD~1 --color-words'
alias grc='git rm --cached -r'

alias locate='locate -itbr'

alias ip='ip -c'

alias du='du -ach'

alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias tart='tar -tzvf'

alias rsync='rsync -avz --progress --info=progress2'

alias da='source $HOME/Documents/FluidTopics/.docker/venv/bin/activate'
alias rfts='cd $HOME/Documents/FluidTopics/interface/fluid-topics-server && ../gradlew run'

alias notify='notify-send "Done ! :)" ; aplay /usr/share/sounds/sound-icons/beginning-of-line'

alias ipsecup='sudo systemctl restart docker ; sudo ipsec down mrs ; sudo ipsec up mrs'

H=$HOME

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

# Go to venv
workon my_env
