#!/usr/bin/env bash

RUBY_VERSION=3.2.2
URL_PREFIX=https://raw.githubusercontent.com/duxin9/install/HEAD

run_script() {
  name=$1
  url=${URL_PREFIX}/${name}
  printf "\033[1m=> Downloading ${url}\033[0m\n"
  sh -c "$(curl -fsSL $url)"
}

# ===== CONFIGURE MACOS =====
echo -e "== macOS Configuration == "
run_script "macos.sh"

# ===== HOMEBREW =====

echo -e "\n== Homebrew  == "

if [ ! -f /opt/homebrew/bin/brew ] &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  printf "\033[32m[ok] Homebrew\033[0m\n"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# ===== RUBY =====

echo -e "\n== rbenv  == "

if ! command -v rbenv &> /dev/null; then
  brew install rbenv
else
  printf "\033[32m[ok] rbenv\033[0m\n"
fi

eval "$(rbenv init -)"

echo -e "\n== Ruby ${RUBY_VERSION}  == "
if ! rbenv versions --bare | grep $RUBY_VERSION &> /dev/null; then
  rbenv install $RUBY_VERSION
else
  printf "\033[32m[ok] Ruby $RUBY_VERSION\033[0m\n"
fi

rbenv global $RUBY_VERSION

echo -e "\n== oh-my-zsh == "
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  printf "\033[32m[ok] oh-my-zsh\033[0m\n"
fi

# ===== PACKAGES  =====

echo -e "\n== Packages  == "
run_script "packages.sh"
