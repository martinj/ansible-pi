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

	 PLAYBOOK=playbooks/octoprint.yml vagrant provision
