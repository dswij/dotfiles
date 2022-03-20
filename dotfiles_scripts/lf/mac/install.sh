#!/bin/bash

# A file tree terminal program
# https://github.com/gokcehan/lf

# brew install
brew install lf

# install extras
readonly lf_path=$HOME/.config/lf
mkdir -p $lf_path
curl https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh -o "$lf_path/lfrc"

# add path to .zshrc
cat >> $HOME/.zshrc << EOF
LFCD="/path/to/lfcd.sh"                                
if [ -f "\$LFCD" ]; then
    source "\$LFCD"
fi
EOF
