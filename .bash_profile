#=  include first interactive settings  =======================================
if [[ $- =~ 'i' ]] && [[ -f ~/.bash_profile_interactive_first ]]; then
  source ~/.bash_profile_interactive_first
fi


#=  Environment Variables  ====================================================
LC_ALL="en_US.utf-8" && export LC_ALL
LESS='-FiMRsWX' && export LESS
PAGER='less' && export PAGER


#=  MySQl  ====================================================================
#PATH=$PATH:/usr/local/mysql/bin && export PATH
#DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH && export DYLD_LIBRARY_PATH


#=  Configure HomeBrew  =======================================================
if [[ -d /home/linuxbrew/.linuxbrew ]]; then
  brew_prefix="/home/linuxbrew/.linuxbrew" && export brew_prefix
  eval $(${brew_prefix}/bin/brew shellenv)
fi

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

#=  Poetry  ===================================================================
if [[ -f ~/.poetry/bin/poetry ]]; then
  PATH="${HOME}/.poetry/bin:$PATH" && export PATH
fi

#=  Go  =======================================================================
if hash go 2>/dev/null; then
  GOPATH=$(go env GOPATH) && export GOPATH
  PATH="${GOPATH}/bin:${PATH}" && export PATH
fi


#=  tfenv  ====================================================================
if [[ -f ~/.tfenv/bin/tfenv ]]; then
  PATH="${HOME}/.tfenv/bin:${PATH}" && export PATH
fi


#=  Serverless  ===============================================================
PATH="$HOME/.serverless/bin:$PATH" && export PATH

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true


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
