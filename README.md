# winlogbeat

### Description
Elastic Winlogbeat is used to forward Windows event logs to ELK ecosystem supported receivers.

### Requirements

#### Platforms
Tested only on Windows Server 2012 R2. But should work on any modern Windows.

### Attributes
|Attribute|Description|Type|Default|
|---------|-----------|----|-------|
|`['winlogbeat']['version']`|Version of Elastic Winlogbeat.|String|`5.4.2`|
|`['winlogbeat']['package_url']`|Url to download Elastic Winlogbeat from.|String|`auto`|
|`['winlogbeat']['notify_restart']`|Automatically restart Winlogbeat if config changes during converge.|Boolean|`true`|
|`['winlogbeat']['install_only']`|If `true` do not create service and generate config file.|Boolean|`false`|
|`['winlogbeat']['install_dir']`|Installation directory for Elastic Winlogbeat.|String|`C:\Program Files\Winlogbeat`|
|`['winlogbeat']['override_config']`|Configuration values to override in default config.|Hash|{}|

### Recipes

* `default.rb` - Install and configure Elastic Winlogbeat.
* `install.rb` - Download Winlogbeat.
* `configure.rb` - Create a service and generate config file.

### Kitchen
```bash
# Full testing: check style, converge and verify instance
chef exec rake
```

### Examples
For examples see `test/fixtures/cookbooks/test` cookbook.

### Authors
* Author:: Azat Khadiev (anuriq@gmail.com)
