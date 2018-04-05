VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.8.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  playbook = "#{ENV['PLAYBOOK']}"
  tags = "#{ENV['TAGS']}"

  if playbook.empty?
    playbook = "unknown"
  end

  config.vm.hostname = "test"

  config.vm.box = "debian/stretch64"

  config.vm.provider "virtualbox" do |v|
    # Give it more juice
    v.cpus = 2
    v.memory = 2048

    # Link to the base image instead of pulling the whole thing into the build
    v.linked_clone = true

    # Various network performance workarounds
    v.customize ["modifyvm", :id, "--nictype1", "virtio" ]
    v.customize ["modifyvm", :id, "--nictype2", "virtio" ]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Install python
  config.vm.provision "install python", type: "shell" do |s|
    s.inline = "sudo apt-get update && sudo apt-get -y install python-minimal && export PYTHONUNBUFFERED=1"
  end

  # Run playbook
  config.vm.provision "playbook", type: "ansible" do |ansible|
    ansible.verbose = "vv"
    ansible.playbook = "#{playbook}"
    if not tags.empty?
      ansible.tags = "#{tags}"
    end
    #ansible.vault_password_file = ".vault_pass"
    # ansible.remote_user = "vagrant"
    ansible.extra_vars = {
      development: true,
      username: "vagrant"
    }
  end
end
