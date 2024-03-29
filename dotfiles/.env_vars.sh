#!/bin/sh

export PATH="$HOME/bin:$HOME/.yarn/bin:$PATH"
export EDITOR="nvim"
export BROWSER="google-chrome-stable"
export TERMINAL="terminator"
export ZSH_COLORIZE_STYLE="paraiso-dark"
export ANDROID_HOME=$HOME/Android/Sdk

[ -f "$HOME/.local/env_vars.sh" ] && . "$HOME/.local/env_vars.sh"

