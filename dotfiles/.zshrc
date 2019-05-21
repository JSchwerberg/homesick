export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=2

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

if [ "${$(uname -r)#*arch}" != "$(uname -r)" ]; then
	plugins=(archlinux)
elif ( [ "${$(uname -r)#*ubuntu}" != "$(uname -r)" ] ||
	[ "${$(uname -r)#*debian}" != "$(uname -r)" ] ); then
		plugins=(debian)
fi

plugins+=(colorize
    celery
    debian
    django
    docker
    docker-compose
    dotenv
    fabric
    git
    kubectl
    pip
    python
    ruby
    scala
    solarized-man
    terraform
    thefuck
    virtualenv
    wd
    yarn
    # TODO: Remove patch plugin once PR is approved.
    # https://github.com/robbyrussell/oh-my-zsh/pull/7635
    colorize-patch
    # This is conveniently a Z, so comes last in alphabetical order,
    # but zsh-syntax-highlighting must be last.
    zsh-syntax-highlighting
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

[ -s "/home/jay/.scm_breeze/scm_breeze.sh" ] && source "/home/jay/.scm_breeze/scm_breeze.sh"
