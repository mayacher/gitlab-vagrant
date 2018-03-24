Vagrant.configure("2") do |config|
  config.vm.define "gitlab" do |gitlab|
    gitlab.vm.box = "centos/6"
    gitlab.vm.hostname = "centos-gitlab"
    gitlab.vm.network "private_network", ip: "192.168.20.2",
      virtualbox__intnet: true
    gitlab.vm.network "forwarded_port", guest: 22, host: 2222
    gitlab.vm.network "forwarded_port", guest: 80, host: 8080
    gitlab.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
      end
    end

   config.vm.define "gitlab-runner" do |runner|
     runner.vm.box = "centos/6"
     runner.vm.hostname = "gitlab-runner"
     runner.vm.network "private_network", ip: "192.168.20.3",
       virtualbox__intnet: true
     #runner.vm.network "forwarded_port", guest: 22, host:2200
     runner.vm.provider "virtualbox" do |v|
       v.memory = 1024
       v.cpus = 1
       end
     end
end
