#!/usr/bin/env bash

brew_install() {
  package_name=$1
  if brew ls --version $package_name &> /dev/null; then
      printf "\033[32m[ok] ${package_name}\033[0m\n"
  else
      brew install --quiet ${package_name}
  fi
}

brew_cask_install() {
  package_name=$1
  if brew ls --cask --version $package_name &> /dev/null; then
      printf "\033[32m[ok] ${package_name}\033[0m\n"
  else
      brew install --cask --quiet ${package_name}
  fi
}

gem_install() {
  package_name=$1
  if gem which ${package_name} &> /dev/null; then
      printf "\033[32m[ok] ${package_name}\033[0m\n"
  else
      gem install -N --quiet ${package_name}
  fi
}

brew_packages=(
  telnet
  jq
  screen
  icu4c
  cmake
  tmux
  gpg
  hub
  the_silver_searcher
  wget
  ffmpeg
  imagemagick
  node
  htop
  gnu-sed
  xcodegen
  ansible
  coreutils
  pyenv
)

brew_cask_packages=(
  iterm2
  keyboard-maestro
  little-snitch
  launchbar
  devonthink
  visual-studio-code
  obsidian
  telegram
  google-chrome
  cryptomator
  tower
)

gems=(
  thwait
  fastlane
  cocoapods
)

echo "> Installing Brew packages..."

for package in "${brew_packages[@]}"; do
  brew_install "$package"
done

echo "> Installing Brew cask packages..."

for package in "${brew_cask_packages[@]}"; do
  brew_cask_install "$package"
done

echo "> Installing Ruby Gems..."

for package in "${gems[@]}"; do
  gem_install "$package"
done
