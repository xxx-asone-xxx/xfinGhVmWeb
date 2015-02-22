# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"

  config.vm.define :web do |node|
    node.vm.box = "CentOS6.4"
    node.vm.hostname = "gcWeb01"
    node.vm.network :private_network, ip: "192.168.33.80"

    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end
 
  config.vm.define :db do |node|
    node.vm.box = "CentOS6.4"
    node.vm.hostname = "gcDb01"
    node.vm.network :private_network, ip: "192.168.33.70"

    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/mainPlaybook.yml"  # 作成したplaybookファイル名
    ansible.inventory_path = "hosts"               # 作成したインベントリーファイル名
    ansible.limit = 'all'
  end


end
