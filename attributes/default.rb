#
# Cookbook Name:: vagrant-httpproxy
# Attributes:: default
#
# Author:: Julian Dunn (<jdunn@opscode.com>)
# Copyright 2013, Opscode, Inc.
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
# Attributes are commented out using the default config file values.
# Uncomment the ones you need, or set attributes in a role.
#

default['vagrant-httpproxy']['proxy-protocol'] = 'http'
default['vagrant-httpproxy']['proxy-host'] = '10.0.2.2'
default['vagrant-httpproxy']['proxy-port'] = '8123'
