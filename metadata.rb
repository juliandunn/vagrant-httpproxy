name             "vagrant-httpproxy"
maintainer       "Opscode, Inc."
maintainer_email "jdunn@opscode.com"
license          "All rights reserved"
description      "Sets up a virtual machine target to have its proxy settings configured for use with Vagrant offline"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

%w{redhat centos oracle scientific amazon fedora suse debian ubuntu mint}.each do |platform|
	supports platform
end

%w{apt yum}.each do |dep|
	depends dep
end