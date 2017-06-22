#
# Cookbook Name:: winlogbeat
# Library:: Helpers
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

module Winlogbeat
  module Helpers
    def self.config_to_yaml(default_conf, override_conf)
      # Convert to YAML. JSON used because input is actually an ImmutableMash of Chef.
      require 'yaml'
      json = JSON.parse(default_conf.to_json)
      override_json = JSON.parse(override_conf.to_json)
      config = Chef::Mixin::DeepMerge.deep_merge(override_json, json)
      YAML.dump(config, indentation: 4).tr('\\', '/')
    end
  end
end
