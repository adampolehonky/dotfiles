#!/bin/zsh

# Antigen load
#-----------------------------------------------------------------------------
source ~/.dotfiles/antigen/antigen.zsh


#-----------------------------------------------------------------------------
# Gitsome bash complete
#-----------------------------------------------------------------------------
autoload bashcompinit
bashcompinit

#-----------------------------------------------------------------------------
# Rbenv enable shims and autocompletion
#-----------------------------------------------------------------------------
eval "$(rbenv init -)"

#-----------------------------------------------------------------------------
# Load aliases, exports and functions
#-----------------------------------------------------------------------------
source $HOME/.dotfiles/zsh/aliases/aliases.zsh
source $HOME/.dotfiles/zsh/on-top/almostontop.plugin.zsh
source $HOME/.dotfiles/zsh/gitsome/gh_complete.sh
source $HOME/.dotfiles/zsh/autopair.zsh
source $HOME/.dotfiles/.tmux/vendor/tmux-mem-cpu-load/tmux-mem-cpu-load.plugin.zsh
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"


#-----------------------------------------------------------------------------
# Android SDK
#-----------------------------------------------------------------------------
# export PATH="/Users/adampolehonky/Library/Android/sdk/platform-tools:$PATH"


#-----------------------------------------------------------------------------
# GOLang Workspace
#-----------------------------------------------------------------------------
export GOPATH=/Users/adampolehonky/Projects/go
export GOROOT=/usr/local/opt/go/libexec
export PATH="$PATH:$GOPATH/bin"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


#-----------------------------------------------------------------------------
# docker-osx-dev
#-----------------------------------------------------------------------------
# export DOCKER_CERT_PATH=/Users/adampolehonky/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://192.168.59.103:2376


#-----------------------------------------------------------------------------
# Pyenv
#-----------------------------------------------------------------------------
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


#-----------------------------------------------------------------------------
# GitHub
#-----------------------------------------------------------------------------
eval "$(hub alias -s)"
export GIT_EDITOR="vim"

#-----------------------------------------------------------------------------
# Start Antigen commands
#-----------------------------------------------------------------------------
antigen use oh-my-zsh
# antigen theme blox
antigen bundle git
antigen bundle pip
antigen bundle srijanshetty/zsh-pip-completion
antigen bundle lein
antigen bundle kennethreitz/autoenv
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle yardnsm/blox-zsh-theme
antigen bundle tmuxinator
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-syntax-highlighting


#-----------------------------------------------------------------------------# Shell integrations
#-----------------------------------------------------------------------------
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line

# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line

export EDITOR="vim"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#-----------------------------------------------------------------------------
# Codi
# Usage: codi [filetype] [filename]
#-----------------------------------------------------------------------------
codi() {
  vim $2 -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi ${1:-python}"
}

# Antigen apply must be at the end
#-----------------------------------------------------------------------------
antigen apply


# Revised zshrc config
#!/bin/zsh

# Antigen load
#-----------------------------------------------------------------------------
source ~/.dotfiles/antigen/antigen.zsh


#-----------------------------------------------------------------------------
# Gitsome bash complete
#-----------------------------------------------------------------------------
autoload bashcompinit
bashcompinit

#-----------------------------------------------------------------------------
# Rbenv enable shims and autocompletion
#-----------------------------------------------------------------------------
eval "$(rbenv init -)"

#-----------------------------------------------------------------------------
# Load aliases, exports and functions
#-----------------------------------------------------------------------------
source $HOME/.dotfiles/zsh/aliases/aliases.zsh
source /usr/local/etc/bash_completion.d/
source $HOME/.dotfiles/zsh/on-top/almostontop.plugin.zsh
source $HOME/.dotfiles/zsh/gitsome/gh_complete.sh
source $HOME/.dotfiles/zsh/autopair.zsh
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"




#-----------------------------------------------------------------------------
# TMUX Config
#-----------------------------------------------------------------------------
#source $HOME/.dotfiles/.tmux/vendor/tmux-mem-cpu-load/tmux-mem-cpu-load.plugin.zsh

#-----------------------------------------------------------------------------
# Android SDK
#-----------------------------------------------------------------------------
# export PATH="/Users/adampolehonky/Library/Android/sdk/platform-tools:$PATH"


#-----------------------------------------------------------------------------
# GOLang Workspace
#-----------------------------------------------------------------------------
export GOPATH=/Users/adampolehonky/go/
export GOBIN=/Users/adampolehonky/go/bin/
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


#-----------------------------------------------------------------------------
# Rust exports
#-----------------------------------------------------------------------------
export PATH="$HOME/.cargo/bin:$PATH"


#-----------------------------------------------------------------------------
# docker-osx-dev
#-----------------------------------------------------------------------------
# export DOCKER_CERT_PATH=/Users/adampolehonky/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://192.168.59.103:2376


#-----------------------------------------------------------------------------
# Pyenv
#-----------------------------------------------------------------------------
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


#-----------------------------------------------------------------------------
# GitHub
#-----------------------------------------------------------------------------
#eval "$(hub alias -s)"
export GIT_EDITOR="vim"


#-----------------------------------------------------------------------------
# Start Antigen commands
#-----------------------------------------------------------------------------
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle pyenv
antigen bindle python
antigen bundle ruby
antigen bundle tmux
antigen bundle httpie
antigen bundle github
antigen bundle django
antigen bundle brew
antigen bundle lein
antigen bundle pip
antigen bundle tmuxinator
antigen bundle command-not-found
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle yardnsm/blox-zsh-theme

#-----------------------------------------------------------------------------# Shell integrations
#-----------------------------------------------------------------------------
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line

# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line

export EDITOR="vim"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#-----------------------------------------------------------------------------
# Codi
# Usage: codi [filetype] [filename]
#-----------------------------------------------------------------------------
codi() {
  vim $2 -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi ${1:-python}"
}

# Antigen apply must be at the end
#-----------------------------------------------------------------------------
antigen apply
