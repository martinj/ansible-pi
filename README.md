Ansible playbooks for my Pi's

## Install dependencies

	ansible-galaxy install -r dependencies.yml --force

## Examples

	# first running, ask for password
	ansible-playbook -k playbooks/octoprint.yml

	# basic

	ansible-playbook playbooks/octoprint.yml

	# using specific tags

	 ansible-playbook playbooks/octoprint.yml --tags "octoprint"

	# run on vagrant

	 PLAYBOOK=playbooks/octoprint.yml vagrant up

	 TAGS=octoprint PLAYBOOK=playbooks/octoprint.yml vagrant up

## IOT Playbook

If it fails on ufw do a reboot. The updates runned by bootstrap role may have changed the kernel.
