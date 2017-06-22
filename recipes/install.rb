#
# Cookbook Name:: winlogbeat
# Recipe:: install
#
# Copyright:: 2016-2017, Azat Khadiev
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

package_url = if node['winlogbeat']['package_url'] == 'auto'
                if node['winlogbeat']['version'].to_i > 1
                  "https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-#{node['winlogbeat']['version']}-windows-x86_64.zip"
                else
                  "https://download.elastic.co/beats/winlogbeat/winlogbeat-#{node['winlogbeat']['version']}-windows.zip"
                end
              else
                node['winlogbeat']['package_url']
              end

package_file = "#{Chef::Config[:file_cache_path]}/#{::File.basename(package_url)}".tr('/', '\\')

remote_file 'winlogbeat_package_file' do
  path package_file
  source package_url
  action :create_if_missing
end

destination = node['winlogbeat']['install_dir']
directory destination do
  recursive true
  action :create
end

node.default['winlogbeat']['service_dir'] = if node['winlogbeat']['version'].to_i > 1
                                              "#{destination}\\winlogbeat-#{node['winlogbeat']['version']}-windows-x86_64"
                                            else
                                              "#{destination}\\winlogbeat-#{node['winlogbeat']['version']}-windows"
                                            end

powershell_script 'Unzip Winlogbeat' do
  code <<-EOH
  $shell = new-object -com shell.application
  $zip = $shell.NameSpace('#{package_file}')
  foreach($item in $zip.items()) {
    $shell.Namespace('#{destination}').copyhere($item)
  }
  EOH
  not_if { ::File.exist?("#{node['winlogbeat']['service_dir']}\\winlogbeat.exe") }
end
