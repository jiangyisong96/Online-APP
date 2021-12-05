# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
VM_PRIVATE_IP_DEV = ENV['PRIVATE_IP_DEV'] || "192.168.101.10"
VM_PRIVATE_IP_TEST = ENV['VM_PRIVATE_IP_TEST'] || "192.168.101.11"
VM_HOST_NAME_DEV = ENV['VM_HOST_NAME_DEV'] || "devoa"
VM_HOST_NAME_TEST = ENV['VM_HOST_NAME_TEST'] || "testoa"

$set_environment_variables = <<SCRIPT
tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF

# AWS environment variables.
export AWS_DEFAULT_REGION=us-east-1
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
EOF
SCRIPT

$install_python3 = <<SCRIPT
sudo amazon-linux-extras enable python3.8
sudo yum install python3.8 -y
SCRIPT

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "devoa", primary: true do |develop_config|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

    # Every Vagrant develop environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    develop_config.vm.box = "gbailey/amzn2"
    develop_config.vbguest.auto_reboot = true
    develop_config.vbguest.auto_update = true
    develop_config.vagrant.plugins = ["vagrant-vbguest","vagrant-reload"]

    develop_config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4096"
    end
    develop_config.vm.provision "shell", inline: $install_python3, run: "once"
    develop_config.vm.provision "shell", inline: $set_environment_variables, run: "always"

    develop_config.vm.host_name = VM_HOST_NAME_DEV
    develop_config.vm.network "private_network", ip: VM_PRIVATE_IP_DEV
    develop_config.vm.network "forwarded_port", guest: 3000, host: 3000
    develop_config.vm.provision "ansible_local" do |ansible|
      ansible.become = true
      ansible.playbook = "/vagrant/misc/ansible/main.yml"
      ansible.install_mode = "pip_args_only"
      ansible.pip_install_cmd = "curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | sudo python"
      ansible.pip_args = "ansible==2.10.7"
    end

    develop_config.vm.provision "shell", inline: '', run: "once"


    # reload vagrant
  	develop_config.vm.provision :reload
  	# develop_config.vm.provision :shell, :path => "misc/json-server/bootstrap_config.sh"

  end

  config.vm.define "testoa" do |test_config|
    test_config.vm.box = "gbailey/amzn2"
    test_config.vbguest.auto_reboot = true
    test_config.vbguest.auto_update = true
    test_config.vagrant.plugins = ["vagrant-vbguest","vagrant-reload"]

    test_config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4096"
    end

    test_config.vm.provision "shell", inline: $set_environment_variables, run: "always"

    test_config.vm.host_name = VM_HOST_NAME_TEST
    test_config.vm.network "private_network", ip: VM_PRIVATE_IP_TEST
    test_config.vm.network "forwarded_port", guest: 6000, host: 6000
    test_config.vm.provision "ansible_local" do |ansible|
      ansible.become = true
      ansible.playbook = "/vagrant/misc/ansible/main-it.yml"
      ansible.install_mode = "pip_args_only"
      # using this as the vagrant version will pull from https://bootstrap.pypa.io/get-pip.py which will throw an error
      # ansible.version = "2.10.10"
      ansible.pip_install_cmd = "curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | sudo python"
      ansible.pip_args = "ansible==2.10.7"
    end
  end
end