
# --- Antigen load & ZSH Plugins
source ~/.dotfiles/antigen/antigen.zsh
source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/auto-completion.zsh
source ~/.dotfiles/zsh/almostontop.plugin.zsh
source ~/.dotfiles/zsh/autopair.zsh
source ~/.fzf/shell/completion.zsh
source ~/.dotfiles/zsh/reporttime.zsh

# --- PATH Exports
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"

# --- Groovy export
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# --- Android SDK
export PATH="~/Library/Android/sdk/platform-tools:$PATH"

# --- GOLang Workspace
export PATH=$PATH:/usr/local/go/bin/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# --- Rust exports
export PATH="$HOME/.cargo/bin:$PATH"

# --- Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# --- fzf Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- Swiftenv exports
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# --- Pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# --- Rbenv enable shims and autocompletion
eval "$(rbenv init -)"
eval $(/usr/libexec/path_helper -s)

export GIT_EDITOR="vim"
# --- Codi (Python) Usage: codi [filetype] [filename]
codi() {
    vim $2 -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi ${1:-python}"
}

# --- Shell integrations
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line

# --- Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line

# --- iTerm 2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# --- docker-osx-dev
# export DOCKER_CERT_PATH=/Users/adampolehonky/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://192.168.59.103:2376

autoload bashcompinit
bashcompinit

# --- Antigen bundles
antigen use oh-my-zsh
antigen bundle zsh-syntax-highlighting
antigen bundle gulp
antigen bundle git
antigen bundle git-prompt
antigen bundle git-extras
antigen bundle pip
antigen bundle pyenv
antigen bundle python
antigen bundle ruby
antigen bundle gem
antigen bundle bundler
antigen bundle tmux
antigen bundle httpie
antigen bundle github
antigen bundle django
antigen bundle brew
antigen bundle lein
antigen bundle tmuxinator
antigen bundle command-not-found
antigen bundle zsh-autosuggestions

# --- ANTIGEN APPLY MUST BE AT THE END
antigen apply
