#!/usr/bin/bash

pushd ~

	#cd /src/pwn.college/ && make push
	#cd /src/problem_solving/ && make push
	#cd /src/urls/ && make push
	#cd /home/smalinux/python/ && make push
	#cd /src/scripts/ && make push # rand python scripts
	#cd /home/smalinux/web_scraping/ && make push
	#cd /home/smalinux/data_science/ && make push
	#cd /src/sc-backup/ && make push
	cd /home/smalinux/docs/ && make push # Update my docs repos (Obsidian) every 3 hours
	#cd /src/c_/ && make push #FIXME: Cleanup: Add this repo to Obsidian
	cd /home/smalinux/.config/fluent-reader && make push

	cd /src/smalinux.github.io/ && make push
	cd /src/md/ && make push
	cd /home/smalinux/docs/ && make push
	cd /src/beaglebone-debian-dev && make push

	cd /src/barebox-cfg/ && make push
	cd /src/linux-cfg/ && make -f make.sh push
	cd /src/buildroot-cfg/ && make push
	# private dotfiles
	cd /home/smalinux/dotfiles/private/ && make push
	cd /src/me/ && make push
	cd /src/openpec/ && make push
	cd /src/linux_in_arabic/ && make push
	cd /src/scrape-karriere && make run
	cd /src/main && make push
	cd /src/dyslexia && make push
	cd /src/tracking-matt-skills && make push
	cd /src/dotclaude && make push
	cd /src/2brain && make push
	cd /src/notes && make push
	# headless claude runs /rc in notes vault; flock = never 2 at once
	cd /src/notes && flock -n /tmp/claude-rc.lock claude -p "/rc" --dangerously-skip-permissions >> /src/notes/.claude-rc-$(date +%F).log 2>&1
	# delete /rc logs older than 30 days
	find /src/notes -maxdepth 1 -name '.claude-rc-*.log' -mtime +30 -delete

	#cd /src/hn_scraper && ./scripts/backup.sh >> ~/data/backup.log 2>&1

popd
