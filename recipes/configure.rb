#
# Cookbook Name:: winlogbeat
# Recipe:: configure
#
# Copyright 2016, Azat Khadiev
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

conf_file = "#{node['winlogbeat']['install_dir']}\\winlogbeat.yml"

file conf_file do
  content Helpers.config_to_yaml(node['winlogbeat']['config'], node['winlogbeat']['override_config'])
  notifies :restart, 'service[winlogbeat]', :delayed if node['winlogbeat']['notify_restart']
end

powershell_script 'install winlogbeat as a service' do
  code <<-EOH
  $conf_file = (Resolve-Path '#{conf_file}').Path
  $exe_file = (Resolve-Path '#{node['winlogbeat']['install_dir']}\\winlogbeat-#{node['winlogbeat']['version']}-windows\\winlogbeat.exe').Path
  $bin_path_name = "`"$exe_file`" -c `"$conf_file`""

  if (Get-Service winlogbeat -ErrorAction SilentlyContinue) {
    $service = Get-WmiObject -Class Win32_Service -Filter "name='winlogbeat'"
    if ($service.PathName -eq $bin_path_name) {
      exit 0
    }
    $service.StopService(); sleep 1;
    $service.delete(); sleep 2;
  }

  New-Service -name winlogbeat -displayName Winlogbeat -binaryPathName $bin_path_name
  EOH
end

service 'winlogbeat' do
  supports status: true, restart: true, enable: true, start: true
  action [:enable, :start]
end
