# weave_net

Chef cookbook for Weave net installation.

Please bear in mind this project is not even in pre-alpha stage. Do not use in
production environment.

Right now only basic actions are supported:

* :enable - downloads weave management script and pulls weave image to host
* :start - starts weave net node
* :stop - stops weave node

You can predefine a peer upon creation by specifying a :peer property.

Usage:

```weave_net_node "master" do
  action [:create, :start, :stop]
  peer hostname.tld
end
