#=  include first interactive settings  =======================================
if [[ $- =~ 'i' ]] && [[ -f ~/.bash_profile_interactive_first ]]; then
  source ~/.bash_profile_interactive_first
fi


#=  Environment Variables  ====================================================
LC_ALL="en_US.utf-8" && export LC_ALL


#=  MySQl  ====================================================================
#PATH=$PATH:/usr/local/mysql/bin && export PATH
#DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH && export DYLD_LIBRARY_PATH


#=  Set HOMEBREW_PREFIX =======================================================
brew_prefix="/home/linuxbrew/.linuxbrew" && export brew_prefix

#=  Homebrew/bin  =============================================================
PATH="${brew_prefix}/bin:${brew_prefix}/sbin:${PATH}" && export PATH
MANPATH="${brew_prefix}/share/man:${MANPATH}" && export MANPATH
INFOPATH="${brew_prefix}/share/info:${INFOPATH}" && export INFOPATH

#=  Homebrew/sbin  ============================================================
# PATH=/usr/local/sbin:$PATH && export PATH

#=  Homebrew/github_api_token =================================================
if [[ -f ~/.homebrew_github_api_token ]]; then
  . ~/.homebrew_github_api_token
fi

#= Homebrew/coreutils  ========================================================
#PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
#MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"


#=  Python  ===================================================================
PYTHONPATH=/usr/local/lib/python2.7/site-packages:${PYTHONPATH} && export PYTHONPATH
PYTHON_CONFIGURE_OPTS="${PYTHON_CONFIGURE_OPTS} --enable-shared" && export PYTHON_CONFIGURE_OPTS
PYTHONSTARTUP=${HOME}/.pystartup && export PYTHONSTARTUP

#=  pyenv  ====================================================================
if hash pyenv 2>/dev/null; then
  PATH=${HOME}/.pyenv/bin:${PATH} && export PATH
  eval "$(pyenv init -)";
fi
if hash pyenv-virtualenv-init 2>/dev/null; then
  eval "$(pyenv virtualenv-init -)";
fi


#=  Serverless Tab Completion  ================================================
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f ${brew_prefix}/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . ${brew_prefix}/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f ${brew_prefix}/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . ${brew_prefix}/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash


#=  Editors  ==================================================================
EDITOR="vim" && export EDITOR
VISUAL="vim" && export VISUAL
SVN_EDITOR="vim" && export SVN_EDITOR
GIT_EDITOR="vim" && export GIT_EDITOR


#=  Aliases  ==================================================================
if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi


#=  Path  =====================================================================
PATH=${HOME}/bin:${PATH} && export PATH


#=  include last interactive settings  ========================================
if [[ $- =~ 'i' ]] && [[ -f ~/.bash_profile_interactive_last ]]; then
  source ~/.bash_profile_interactive_last
fi
