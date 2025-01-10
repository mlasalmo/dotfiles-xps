#!/usr/bin/env bash

# This script must exit as fast as possible when pre-requisites are already
# met, so we only import the scripts-library when we really need it.

set -eu

wanted_packages=(
  git  # used to find the latest revisions of github repositories
  curl # used to find the latest version of github repositories
  keepassxc
  zsh
)

missing_packages=()

for package in "${wanted_packages[@]}"; do
  if ! command -v "${package}" >/dev/null; then
    missing_packages+=("${package}")
  fi
done

if [[ ${#missing_packages[@]} -eq 0 ]]; then
  exit 0
fi

# shellcheck source=../.chezmoitemplates/scripts-library
source "${CHEZMOI_SOURCE_DIR?}/.chezmoitemplates/scripts-library"

log_task "Installing missing packages with APT: ${missing_packages[*]}"

# Chezmoi keepassxc functionality to work with attachments (SSH keys) requires at least version 2.7.0.
# https://www.chezmoi.io/reference/templates/keepassxc-functions/keepassxcAttachment/
c sudo add-apt-repository --yes ppa:phoerious/keepassxc
c sudo apt-get update
c sudo DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends "${missing_packages[@]}"
c sudo update-ca-certificates
