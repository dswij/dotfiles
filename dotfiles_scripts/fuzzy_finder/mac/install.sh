#!/bin/bash

# Script to install fuzzy search capability


# --- ripgrep
brew install ripgrep

# --- fzf
brew install fzf
$(brew --prefix)/opt/fzf/install
