#
# Cookbook Name:: sonos
# Recipe:: webcontroller
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

directory '/opt/sonos/webcontroller' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

git '/opt/sonos/webcontroller' do
  repository 'https://github.com/jishi/node-sonos-web-controller'
end

nodejs_npm 'sonos-web-controller' do
  json true
  path '/opt/sonos/webcontroller'
end

directory '/opt/sonos/webcontroller/cache' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

template '/etc/init.d/webcontroller' do
  path '/etc/init.d/webcontroller'
  source 'webcontroller.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[webcontroller]'
end

service 'webcontroller' do
  supports restart: true, start: true, stop: true, reload: false
  action [ :enable, :start ]
end
