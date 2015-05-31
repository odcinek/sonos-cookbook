#
# Cookbook Name:: sonos
# Recipe:: default
#
# Author:: Marcin Sawicki <odcinek@gmail.com>
# Copyright:: (c) 2015, Marcin Sawicki
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

[
  'avahi-daemon',
  'avahi-discover',
  'libnss-mdns',
  'libavahi-compat-libdnssd-dev',
  'git',
].each do |package|
  package package do
    action :install
  end
end

include_recipe 'nodejs'
include_recipe 'nodejs::npm'

include_recipe 'sonos::airsonos'
include_recipe 'sonos::webcontroller'
