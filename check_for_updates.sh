#!/bin/sh

update() {

	git fetch
	if [ "$(git rev-parse HEAD)" -eq "$(git rev-parse @{u})" ]; then
		exit 0
	else
		update_homesick
	fi
}

update_homesick() 
{
	# Backup zshrc so we can roll back easily. It powers everything.
	cp $HOME/.zshrc $HOME/.zshrc.old

	(git pull && rsync -aP  dotfiles/ $HOME) || log_and_exit "Updating dotfiles failed. Please review logs."
	. $HOME/.zshrc || rollback_zshrc
}

rollback_zshrc()
{
	cp $HOME/.zshrc.old $HOME/.zshrc
	source $HOME/.zshrc && log_and_exit "zshrc failed to load and has been rolled back. System may be in an inconsistent state."
}

log_and_exit() 
{
	echo $1
	exit -1
}
	
update
