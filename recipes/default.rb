#
# Cookbook Name:: vagrant-httpproxy
# Recipe:: default
#
# Copyright (C) 2013 Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

proxyurl = node['vagrant-httpproxy']['proxy-protocol'] + '://' + node['vagrant-httpproxy']['proxy-host'] + ':' + node['vagrant-httpproxy']['proxy-port']

case node['platform_family']
when "fedora", "rhel"
	node.override['yum']['proxy'] = node['vagrant-httpproxy']['proxy-url']
	include_recipe "yum::yum"

when "suse"
	template "/etc/sysconfig/proxy" do
		source "proxy.erb"
		owner "root"
		group "root"
		mode 00644
		variables(
			:proxyurl => proxyurl
		)
		action :create
	end
	
when "arch"
	# Uncomment Xfercommand like so: http://michael.otacoo.com/manuals/arch-linux/misc-configuration/proxy-settings/
	# Maybe using @someara's line cookbook?

	# Then:

	template "/etc/wgetrc" do
		source "wgetrc.erb"
		owner "root"
		group "root"
		mode 00644
		variables(
			:proxyurl => proxyurl
		)
		action :create	
	end

when "debian"
	node.override['apt']['key_proxy'] = proxyurl
	node.override['apt']['cacher_ipaddress'] = node['vagrant-httpproxy']['proxy-host']
	node.override['apt']['cacher_port'] = node['vagrant-httpproxy']['proxy-port']
	include_recipe "apt::cacher-client"

when "freebsd", "netbsd", "openbsd"
	# TK, I have no idea what to do ... do pkgsrc and ports use these at all?

when "windows"
	# Some registry settings like this? http://support.microsoft.com/kb/819961

end

# Set up gem
template "/etc/gemrc" do
	source "gemrc.erb"
	owner "root"
	group "root"
	mode 00644
	variables(
		:proxyurl => proxyurl
	)
	action :create
end

# Set up curl - has no global config
template "#{ENV['HOME']}/.curlrc" do
	source "dot-curlrc.erb"
	owner "root"
	group "root"
	mode 00644
	variables(
		:proxyurl => proxyurl
	)
	action :create	
end	
