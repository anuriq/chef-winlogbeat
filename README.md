# winlogbeat

### Description
Elastic Winlogbeat is used to forward Windows event logs to elastic and/or logstash.

### Requirements

#### Platforms
Tested only on Windows Server 2012 R2.

### Attributes
|Attribute|Description|Type|Default|
|---------|-----------|----|-------|
|['winlogbeat']['version']|Version of Elastic Winlogbeat.|String|1.2.2|
|['winlogbeat']['package_url']|Url to download Elastic Winlogbeat from.|String|auto|
|['winlogbeat']['notify_restart']|Automatically restart Winlogbeat if config changes during converge.|Boolean|`true`|
|['winlogbeat']['install_only']|If `true` do not create service and generate config file.|Boolean|`false`|
|['winlogbeat']['install_dir']|Installation directory for Elastic Winlogbeat.|String|C:\Program Files\Winlogbeat|
|['winlogbeat']['override_config']|Configuration values to override in default config.|Hash|{}|

### Recipes

* `default.rb` - Install and configure Elastic Winlogbeat.
* `install.rb` - Download Winlogbeat.
* `configure.rb` - Create a service and generate config file.


### Kitchen
```bash
# check style
chef exec rake style
# converge and run tests
chef exec rake integration:vagrant
```

### Examples
For examples see `test/shared/cookbooks/test` cookbook.

### Authors
* Author:: Azat Khadiev (anuriq@gmail.com)
