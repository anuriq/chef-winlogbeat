#
# Cookbook Name:: winlogbeat
# Attributes:: config
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

# https://github.com/elastic/winlogbeat/blob/master/etc/winlogbeat.yml
# https://www.elastic.co/guide/en/beats/winlogbeat/current/winlogbeat-configuration.html

default['winlogbeat']['config']['winlogbeat']['registry_file'] = 'C:/ProgramData/winlogbeat/.winlogbeat.yml'
# default['winlogbeat']['config']['winlogbeat']['event_logs'] = [
#   { 'name' => 'Application', 'ignore_older' => '72h' },
#   { 'name' => 'System' }
# ]

# default['winlogbeat']['config']['winlogbeat']['metrics']['bindaddress'] = 'localhost:8123'

default['winlogbeat']['config']['output'] = {}
# elasticsearch host info
# default['winlogbeat']['config']['output']['elasticsearch']['enabled'] = true
# default['winlogbeat']['config']['output']['elasticsearch']['hosts'] = ['localhost:9200']
# default['winlogbeat']['config']['output']['elasticsearch']['save_topology'] = false
# default['winlogbeat']['config']['output']['elasticsearch']['max_retries'] = 3
# default['winlogbeat']['config']['output']['elasticsearch']['bulk_max_size'] = 1000
# default['winlogbeat']['config']['output']['elasticsearch']['flush_interval'] = nil
# default['winlogbeat']['config']['output']['elasticsearch']['protocol'] = 'http'
# default['winlogbeat']['config']['output']['elasticsearch']['username'] = nil
# default['winlogbeat']['config']['output']['elasticsearch']['password'] = nil
# default['winlogbeat']['config']['output']['elasticsearch']['index'] = 'winlogbeat'
# default['winlogbeat']['config']['output']['elasticsearch']['path'] = '/elasticsearch'

# Logstash Output config info
# default['winlogbeat']['config']['output']['logstash']['enabled'] = false
# default['winlogbeat']['config']['output']['logstash']['hosts'] = ['localhost:5044']
# default['winlogbeat']['config']['output']['logstash']['loadbalance'] = true
# default['winlogbeat']['config']['output']['logstash']['save_topology'] = true
# default['winlogbeat']['config']['output']['logstash']['index'] = 'winlogbeat'

# default['winlogbeat']['config']['output']['file']['enabled'] = false
# default['winlogbeat']['config']['output']['file']['path'] = '/tmp/winlogbeat'
# default['winlogbeat']['config']['output']['file']['filename'] = 'winlogbeat'
# default['winlogbeat']['config']['output']['file']['rotate_every_kb'] = 1_000
# default['winlogbeat']['config']['output']['file']['number_of_files'] = 7

# Logging Output configs
default['winlogbeat']['config']['logging']['to_files'] = false
# default['winlogbeat']['config']['logging']['files']['path'] = "C:/ProgramData/winlogbeat/Logs"
# default['winlogbeat']['config']['logging']['files']['rotateeverybytes'] = 10485760 # = 10MB
# default['winlogbeat']['config']['logging']['level'] = 'error'
