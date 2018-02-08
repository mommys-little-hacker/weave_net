property :peer, [String, nil], default: nil
property :binary_path, String, default: "/usr/local/bin/weave", desired_state: false
property :installed, [true, false], desired_state: false
property :running, [true, false], desired_state: false

default_action :create

load_current_value do
  if ::File.file?(binary_path) then
    require_relative "../libraries/docker_check"

    installed img_exists?("weaveworks/weave")
    running cnt_exists?("weave")
  else
    current_value_does_not_exist!
  end
end

action :create do
    bash "install" do
      code <<-EOH
      curl -L git.io/weave -o #{new_resource.binary_path}
      chmod a+x #{new_resource.binary_path}
      EOH
      not_if { ::File.file?(new_resource.binary_path) }
    end
    bash "setup" do
      code "#{new_resource.binary_path} setup"
      not_if { current_resource.installed == true }
    end
end

action :start do
  bash "slave" do
    code "#{new_resource.binary_path} launch #{new_resource.peer}"
    only_if { current_resource.running == false && new_resource.peer.nil? == false }
  end
  bash "master" do
    code "#{new_resource.binary_path} launch"
    only_if { current_resource.running == false && new_resource.peer.nil? == true }
  end
end

action :stop do
  bash "stop" do
    code "#{current_resource.binary_path} stop"
  end
  current_resource.running false
end
