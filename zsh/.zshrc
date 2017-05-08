#-----------------------------------------------------------------------------
# Antigen load & ZSH Plugins
#-----------------------------------------------------------------------------
source ~/.dotfiles/antigen/antigen.zsh
source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/auto-completion.zsh
source ~/.dotfiles/zsh/almostontop.plugin.zsh
source ~/.dotfiles/zsh/autopair.zsh
source ~/.fzf/shell/completion.zsh
source ~/.dotfiles/zsh/reporttime.zsh
source ~/.dotfiles/zsh/tmuxinator.zsh

#-----------------------------------------------------------------------------
# PATH Exports
#-----------------------------------------------------------------------------

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME~/.dotfiles/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/bin:$PATH"
#--- Groovy export
export GROOVY_HOME=/usr/local/opt/groovy/libexec
#--- Android SDK
export PATH="~/Library/Android/sdk/platform-tools:$PATH"
#--- GOLang Workspace
export PATH=$PATH:/usr/local/go/bin/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
#--- Rust exports
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
# Rbenv enable shims and autocompletion
#-----------------------------------------------------------------------------
eval "$(rbenv init -)"
eval $(/usr/libexec/path_helper -s)

#-----------------------------------------------------------------------------
# Git and GitHub
#-----------------------------------------------------------------------------
#eval "$(hub alias -s)"
export GIT_EDITOR="vim"

autoload bashcompinit
bashcompinit

#-----------------------------------------------------------------------------
# Start Antigen commands
#-----------------------------------------------------------------------------
antigen use oh-my-zsh
antigen bundle thewtex/tmux-mem-cpu-load
antigen bundle cask
antigen bundle cargo
antigen bundle colorize
antigen bundle autopep8
antigen bundle react-native
antigen bundle go
antigen bundle golang
antigen bundle grunt
antigen bundle gulp
antigen bundle git
antigen bundle git-prompt
antigen bundle git-extras
antigen bundle pip
antigen bundle pyenv
antigen bundle python
antigen bundle ruby
antigen bundle rake
antigen bundle rbenv
antigen bundle gem
antigen bundle bundler
antigen bundle rust
antigen bundle thor
antigen bundle tmux
antigen bundle httpie
antigen bundle github
antigen bundle django
antigen bundle brew
antigen bundle lein
antigen bundle tmuxinator
antigen bundle command-not-found
antigen bundle npm
antigen bundle node
antigen bundle zsh-autosuggestions

#-----------------------------------------------------------------------------
# Shell integrations
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

# iTerm 2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Codi (Python) Usage: codi [filetype] [filename]

codi() {
    vim $2 -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi ${1:-python}"
}

# fzf Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Antigen apply must be at the end
antigen bundle zsh-syntax-highlighting

antigen apply
