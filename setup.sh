#!/bin/bash

echo "What is your name?"
read user_name
echo
echo "What is your email?"
read user_email

git_local='git/tmp'
cat > $git_local <<EOF
[user]
        name = $user_name
        email = $user_email
EOF

zshenv=~/tmp
cat > $zshenv <<EOF
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/.cache"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/.share"
export XDG_RUNTIME_HOME="$XDG_CONFIG_HOME/.share"
ZDOTDIR=$XDG_CONFIG_HOME/zsh
EOF
