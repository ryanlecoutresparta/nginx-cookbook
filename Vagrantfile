required_plugins = %w( vagrant-hostsupdater vagrant-berkshelf )
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end

Vagrant.configure("2") do |config|

  # config.vm.box = "base"

  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "ubuntu/xenial64"
    nginx.vm.network "private_network", ip: "192.168.10.100"
    nginx.hostsupdater.aliases = ["development.local"]

    nginx.vm.synced_folder "environment", "/home/ubuntu/environment"
    nginx.vm.synced_folder "app0", "/home/ubuntu/app"

    nginx.vm.provision "chef_solo" do |chef|
      chef.add_recipe "nginx-cookbook::default"
    end
  end
end
