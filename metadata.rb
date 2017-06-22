name 'winlogbeat'
maintainer 'Azat Khadiev'
maintainer_email 'anuriq@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures Elastic Winlogbeat'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/anuriq/chef-winlogbeat' if respond_to?(:source_url)
issues_url 'https://github.com/anuriq/chef-winlogbeat/issues' if respond_to?(:issues_url)
version '1.0.0'

supports 'windows'

chef_version '>= 12' if respond_to?(:chef_version)
