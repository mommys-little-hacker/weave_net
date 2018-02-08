#
# Cookbook:: weave_net
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package ["gnupg", "dirmngr", "apt-transport-https"]

docker_installation_package "default" do
  package_name "docker-ce"
end

service "docker" do
  supports status: true
  action [:enable, :start]
end

weave_net_node "master" do
  action [:create, :start, :stop, :start]
end
