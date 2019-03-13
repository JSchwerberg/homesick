# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=2

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"


plugins=(git 
    colorize 
    celery 
    django 
    pip 
    python 
    virtualenv 
    fabric 
    debian 
    docker 
    dotenv 
    ruby
    archlinux
    docker-compose
    solarized-man
    thefuck
    zsh-syntax-highlighting
    # TODO: Remove patch plugin once PR is approved.
    # https://github.com/robbyrussell/oh-my-zsh/pull/7635
    colorize-patch
)

source $ZSH/oh-my-zsh.sh

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# TODO: Figure out why update script bounces
#if [ -f "$HOME/homesick/check_for_updates.sh" ]; then 
#	cd "$HOME/homesick"
#	. "$HOME/homesick/check_for_updates.sh"
#fi


if [ -f "/usr/share/nvm/init-nvm.sh" ]; then source "/usr/share/nvm/init-nvm.sh"; fi

if [ -f "/usr/share/todoist/todoist_functions.sh" ]; then . "/usr/share/todoist/todoist_functions.sh"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

[ -f "$HOME/.env_vars.sh" ] && . "$HOME/.env_vars.sh"


eval $(thefuck --alias)
eval "$(rbenv init -)"

# Aliases now that everything loaded
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"

# Bash Scripts
[ -f "$HOME/.scripts/todoist" ] && source "$HOME/.scripts/todoist"

# Machine specific stuff not in source control
[ -f "$HOME/.local/.zsh_aliases" ] && source "$HOME/.local/.zsh_aliases"



neofetch 
