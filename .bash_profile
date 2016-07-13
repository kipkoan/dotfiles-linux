#=  include interactive settings  =============================================
if [[ $- =~ i ]] && [[ -f ~/.bash_profile_interactive ]]; then
  source ~/.bash_profile_interactive
fi


#=  vi-style command-line editing  ============================================
set -o vi


#=  Environment Variables  ====================================================
LC_ALL="en_US.utf-8" && export LC_ALL


#=  SSH_AUTH_SOCK fix  ========================================================
source $HOME/bin/start-ssh-agent


#=  MySQl  ====================================================================
#PATH=$PATH:/usr/local/mysql/bin && export PATH
#DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH && export DYLD_LIBRARY_PATH


#=  Python  ===================================================================
PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH && export PYTHONPATH


#=  Editors  ==================================================================
EDITOR="vim" && export EDITOR
VISUAL="vim" && export VISUAL
SVN_EDITOR="vim" && export SVN_EDITOR
GIT_EDITOR="vim" && export GIT_EDITOR


#=  Terminal colours (after installing GNU coreutils)  ========================
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;32m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

PS1="$NM[$HI\u@$HII\h $SI\w$NM]\\\$$IN " && export PS1

if [ "$TERM" != "dumb" ]; then
  LS_OPTIONS='--color=auto' && export LS_OPTIONS
  GREP_OPTIONS='--color=auto' && export GREP_COLORS
  CLICOLOR=1 && export CLICOLOR
  eval `dircolors ~/.dir_colors`
fi


#=  make history store more commands (1000000 bytes)  =========================
HISTSIZE=1000000 && export HISTSIZE
HISTFILESIZE=1000000 && export HISTFILESIZE
HISTTIMEFORMAT='%F %T  ' && export HISTTIMEFORMAT
if [[ ! -d ${HOME}/.history ]]; then
  if [[ -e ${HOME}/.history ]]; then
    mv ${HOME}/.history ${HOME}/.history.bak
  fi
  mkdir ${HOME}/.history
  chmod 777 ${HOME}/.history
fi
HISTFILE="${HOME}/.history/$(whoami)" && export HISTFILE

#=  unify bash history across session exits, and update in realtime  ==========
shopt -s histappend
if [[ ! ${PROMPT_COMMAND} =~ 'history -a; history -n;' ]]; then
  PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND" && export PROMPT_COMMAND
fi

#=  store multi-line commands in history  =====================================
shopt -s cmdhist

#=  verify history before executing  ==========================================
shopt -s histverify

#=  customize what goes into history  =========================================
HISTCONTROL=ignoredups:ignorespace && export HISTCONTROL
HISTIGNORE="ls:ll:la:ls.:l.:man:[bf]g:history:history *:h:h *:clear:c:exit:e" && export HISTIGNORE

#=  z ("cd" jump history)  ====================================================
#. $HOME/bin/z.src/z.sh


#=  Aliases  ==================================================================
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi


#=  Path  =====================================================================
PATH=$HOME/bin:$PATH && export PATH


#=  Prompt  ===================================================================
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi


#=  cd to symlinked ~  ========================================================
if [[ $(pwd) =~ ${HOME}(\$|\/)(.*) ]]; then
  cd ~/"${BASH_REMATCH[2]}"
fi


#=  Start TMUX on Login  ======================================================
if [[ -z $TMUX ]]; then
  tm $(date +%Y%m%d%H%M%S)
fi


#=  output w & nproc  =========================================================
if [[ $- == *i* ]]; then
  w
fi
