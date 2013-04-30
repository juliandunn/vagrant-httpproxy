Description
===========

This cookbook sets up generic HTTP and HTTPS proxy settings on a Vagrant target so that you can do Chef cookbook development while offline (say, on an airplane). The objective is to make at least the following resources all use the proxy:

* package
* gem / chef_gem
* remote_file

You likely want to use a proxy like [Polipo](http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/) that can return dirty objects from cache if the upstream isn't available.

Requirements
============

A Vagrant virtual machine. Doesn't matter if it's VMWare or VirtualBox backed, but cloud-backed probably doesn't make a lot of sense for the airplane use case.

Usage
=====

Add recipe[vagrant-httpproxy] to your Vagrant machine's run list.

Attributes
==========

See `attributes/default.rb` for default values.

* node['vagrant-httpproxy']['proxy-protocol'] - the protocol of your proxy server
* node['vagrant-httpproxy']['proxy-host'] - the host of your proxy server (probably 10.0.2.2 if running VirtualBox with a proxy on your host)
* node['vagrant-httpproxy']['proxy-port'] - the port of your proxy server

Recipes
=======

default
-------

Sets a bunch of attributes at override priority to configure the following things to use the proxy:

* yum (if on a RHEL-type system)
* apt (if on a Debian-type system)
* gem (via writing something out to the /etc/gemrc)
* curl (via writing a /root/.curlrc)

Override priority is chosen for obvious reasons, so as to override any settings one might have in one's own recipes.

To-Do
=====

* Integrate with the [vagrant-proxy](https://github.com/clintoncwolfe/vagrant-proxy) Vagrant plugin that was started during the ChefConf 2013 hack day. The plugin could conceivably manipulate the run list to add this cookbook automatically, set up / start a proxy on the host machine, and take care of prepopulating Polipo's cache directory with objects from a specified local filesystem directory.

Author
======

Author:: Julian C. Dunn (<jdunn@opscode.com>)

Copyright:: 2013, Opscode, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
