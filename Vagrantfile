# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "CentOS6.4"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
  
  config.vm.define :web101 do |node|
    node.vm.box = "CentOS6.4"
    node.vm.hostname = "gcWeb101"
    node.vm.network :private_network, ip: "192.168.1.80"
    node.vm.network "forwarded_port", guest: 80, host: 8110

    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
  end
 
  config.vm.define :db101 do |node|
    node.vm.box = "CentOS6.4"
    node.vm.hostname = "gcDb101"
    node.vm.network :private_network, ip: "192.168.1.70"
    node.vm.network "forwarded_port", guest: 70, host: 7110

    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end
 
  config.vm.define :admin101 do |node|
    node.vm.box = "CentOS6.4"
    node.vm.hostname = "gcAdmin101"
    node.vm.network :private_network, ip: "192.168.1.60"
    node.vm.network "forwarded_port", guest: 70, host: 6110

    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end


  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/site.yml"  # 作成したplaybookファイル名
    ansible.inventory_path = "ansible/hosts"               # 作成したインベントリーファイル名
    ansible.limit = 'all'
  end


end
