# --- Antigen load & ZSH Plugins
source ~/.dotfiles/antigen.zsh

SAVEHIST=1000
HISTFILE=~/.zsh_history

# --- PATH Exports
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
# export PATH=$HOME/.composer/vendor/bin:$PATH
export HOMEBREW_GITHUB_API_TOKEN="e57f99456efbd64c25f2a02def785e33eb028c6e"

# NVM Node.js version manager
export PATH="$(yarn global bin):$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- PHP 7 cli
# export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# --- Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=/Users/adampolehonky/Library/Android/sdk/platform-tools:$PATH

# --- Dart exports
export PATH="$PATH":"~/.pub-cache/bin"
export PATH=/Users/adampolehonky/flutter/bin:$PATH

# --- GOLang Workspace
export GOPATH="/Users/adampolehonky/Projects/src-code/golang"
export PATH="$PATH:$GOROOT/bin"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH"
export GOROOT="/usr/local/opt/go/libexec"


# --- Rust exports
export RUST_SRC_PATH=/Users/adampolehonky/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
export PATH=~/.cargo/bin:$PATH

# --- Swiftenv exports
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# --- VIM
export GIT_EDITOR="code-insiders"

# source ~/.dotfiles/zsh/statusline.zsh-theme
source ~/.dotfiles/zsh/almostontop.plugin.zsh
source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/zsh-autosuggestions.zsh
source ~/.dotfiles/zsh/autopair.zsh
source ~/.dotfiles/zsh/reporttime.zsh

# Python3 Virtualenv
alias py3venv='source $HOME/Projects/python/pydevenv/python3env/bin/activate'

# zsh completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list +'l:|=* r:|=*'
zstyle ':completion:*' menu select

plugins=(zsh-completions)
eval $(/usr/libexec/path_helper -s)
eval "$(thefuck --alias)"
eval "$(rbenv init -)"

# --- Exercism completion
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

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

###-tns-completion-start-###
if [ -f /Users/adampolehonky/.tnsrc ]; then
    source /Users/adampolehonky/.tnsrc
fi
###-tns-completion-end-###

# --- Antigen bundles
antigen use oh-my-zsh

# Syntax highlighting bundle
antigen bundle pip
antigen bundle httpie
antigen bundle zsh-autosuggestions
antigen bundle git
antigen bundle git-prompt
antigen bundle git-extras
antigen bundle python
antigen bundle django
antigen bundle brew
antigen bundle lein
antigen bundle tmuxinator
antigen bundle command-not-found
antigen bundle jekyll
antigen bundle lukechilds/zsh-nvm
antigen bundle hlissner/zsh-autopair
antigen bundle zsh-users/zsh-syntax-highlighting
# Antigen theme
antigen theme https://github.com/halfo/lambda-mod-zsh-theme

# --- ANTIGEN APPLY MUST BE AT THE END
antigen apply
