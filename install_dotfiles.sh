#!/bin/sh

# Welcome to the 18F laptop script!
# Be prepared to turn your laptop (or desktop)
# into an awesome development machine.

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_file() {
  local file="$1"
  local text="$2"

  if [ "$file" = "$HOME/.zshrc" ]; then
    if [ -w "$HOME/.zshrc.local" ]; then
      file="$HOME/.zshrc.local"
    else
      file="$HOME/.zshrc"
    fi
  fi

  if ! grep -qs "^$text$" "$file"; then
    printf "\n%s\n" "$text" >> "$file"
  fi
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

if [ ! -f "$HOME/.zshrc" ]; then
  touch "$HOME/.zshrc"
fi

# shellcheck disable=SC2016
append_to_file "$HOME/.zshrc" 'export PATH="$HOME/.bin:$PATH"'

case "$SHELL" in
  */zsh) : ;;
  *)
    fancy_echo "Changing your shell to zsh ..."
      chsh -s "$(which zsh)"
    ;;
esac

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  brew list -1 | grep -Fqx "$1"
}

brew_is_upgradable() {
  ! brew outdated --quiet "$1" >/dev/null
}

brew_tap_is_installed() {
  brew tap | ag "$1" > /dev/null
}

brew_tap() {
  if ! brew_tap_is_installed "$1"; then
    fancy_echo "Tapping $1..."
    brew tap "$1" 2> /dev/null
  fi
}

gem_install_or_update() {
  if gem list "$1" | grep "^$1 ("; then
    fancy_echo "Updating %s ..." "$1"
    gem update "$@"
  else
    fancy_echo "Installing %s ..." "$1"
    gem install "$@"
  fi
}

brew_cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_is_installed() {
  local NAME
  NAME=$(brew_cask_expand_alias "$1")
  brew cask list -1 | grep -Fqx "$NAME"
}

app_is_installed() {
  local app_name
  app_name=$(echo "$1" | cut -d'-' -f1)
  find /Applications -iname "$app_name*" -maxdepth 1 | egrep '.*' > /dev/null
}

brew_cask_install() {
  if app_is_installed "$1" || brew_cask_is_installed "$1"; then
    fancy_echo "$1 is already installed. Skipping..."
  else
    fancy_echo "Installing $1..."
    brew cask install "$@"
  fi
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    # shellcheck disable=SC2016
    append_to_file "$HOME/.zshrc" 'export PATH="/usr/local/bin:$PATH"'
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update

brew_install_or_upgrade 'git'

brew_install_or_upgrade 'the_silver_searcher'

brew_tap 'gapple/services'

brew_install_or_upgrade 'postgresql'
fancy_echo 'Restarting postgres...'
brew services restart postgresql

brew_install_or_upgrade 'mysql'
fancy_echo 'Restarting mysql...'
brew services restart mysql
sleep 2
mysql.server start

brew_install_or_upgrade 'redis'
fancy_echo 'Restarting redis...'
brew services restart redis

brew_install_or_upgrade 'imagemagick'
brew_install_or_upgrade 'phantomjs'

brew_install_or_upgrade 'hub'
# shellcheck disable=SC2016
append_to_file "$HOME/.zshrc" 'eval "$(hub alias -s)"'

brew_install_or_upgrade 'node'
brew_install_or_upgrade 'python3'

if ! pip3 list | ag "virtualenvwrapper" > /dev/null; then
  fancy_echo 'Installing virtualenvwrapper...'
  pip3 install virtualenvwrapper
  append_to_file "$HOME/.zshrc" 'export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3'
  append_to_file "$HOME/.zshrc" 'export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv'
  append_to_file "$HOME/.zshrc" 'source /usr/local/bin/virtualenvwrapper.sh'
fi

append_to_file "$HOME/.gemrc" 'gem: --no-document'


if ! command -v rbenv >/dev/null; then
  if ! command -v rvm >/dev/null; then
    fancy_echo 'Installing RVM and the latest Ruby...'
    curl -L https://get.rvm.io | bash -s stable --ruby --auto-dotfiles --autolibs=enable
    . ~/.rvm/scripts/rvm
  else
    local_version="$(rvm -v 2> /dev/null | awk '$2 != ""{print $2}')"
    latest_version="$(curl -s https://raw.githubusercontent.com/wayneeseguin/rvm/stable/VERSION)"
    if [ "$local_version" != "$latest_version" ]; then
      fancy_echo 'Upgrading RVM...'
      rvm get stable --auto-dotfiles --autolibs=enable --with-gems="bundler"
    else
      fancy_echo "Already using the latest version of RVM. Skipping..."
    fi
  fi
fi

fancy_echo 'Updating Rubygems...'
gem update --system

gem_install_or_update 'bundler'

fancy_echo "Configuring Bundler ..."
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))

brew_tap 'caskroom/cask'

brew_install_or_upgrade 'brew-cask'

brew_tap 'caskroom/versions'

brew_cask_install 'github'
brew_cask_install 'sublime-text3'

if app_is_installed 'GitHub'; then
  fancy_echo "It looks like you've already configured your GitHub SSH keys."
  fancy_echo "If not, you can do it by signing in to the GitHub app on your Mac."
elif [ ! -f "$HOME/.ssh/github_rsa.pub" ]; then
  open ~/Applications/GitHub.app
fi

fancy_echo 'All done!'