#!/bin/bash

set -e -x

HISTORY_FILE="$HOME/.bash_history"
BACKUP_FILE="bash_history"

# Check if .bash_history already exists in the repo
if [ -f "$BACKUP_FILE" ]; then
	echo -e "\033[0;31mERROR: You are trying to overwrite bash_history. Careful!\033[0m"
	exit 1
else
	# First time setup - copy current history
	cp "$HISTORY_FILE" "$BACKUP_FILE"
	echo "# Bash History Backup" >README.md
	git add README.md "$BACKUP_FILE"
	git commit -m "Initial commit with bash history"
fi
