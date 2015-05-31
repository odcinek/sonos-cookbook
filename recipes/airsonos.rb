#
# Cookbook Name:: sonos
# Recipe:: airsonos
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

package 'g++' do
  action :install
end

directory "/opt/sonos/airsonos" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

#nodejs_npm "airsonos" do
#  not_if 'sudo npm list -g | grep airsonos'
#  url "stephen/airsonos"
#end

git '/opt/sonos/airsonos' do
  repository 'https://github.com/stephen/airsonos.git'
end

nodejs_npm 'airsonos' do
  path '/opt/sonos/airsonos'
  json true
end

link '/usr/bin/airsonos' do
  only_if 'stat /usr/lib/node_modules/airsonos/index.js'
  to '/usr/lib/node_modules/airsonos/index.js'
end

template "/etc/init.d/airsonos" do
  path "/etc/init.d/airsonos"
  source "airsonos.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :reload, "service[airsonos]", :delayed
end

service "airsonos" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action :enable
end
