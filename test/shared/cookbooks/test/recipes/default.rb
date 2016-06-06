
logservers = search(:node, 'role:logserver')
raise "Log server was not found. Create a node with role 'logserver'." if logservers.empty?

node.set['winlogbeat']['override_config'] = {
  'winlogbeat' => {
    'registry_file' => "#{ENV['ProgramData']}\\Winlogbeat\\.winlogbeat.yml",
    'event_logs' => [
      { 'name' => 'Application', 'ignore_older' => '72h' },
      { 'name' => 'System' }
    ]
  },
  'output' => {
    'logstash' => {
      'enabled' => true,
      'hosts' => logservers.collect { |n| "#{n['fqdn']}:#{n['logstash']['tcp']['port']}" },
      'loadbalance' => false
    }
  },
  'logging' => {
    'to_files' => true,
    'files' => {
      'path' => "#{ENV['ProgramData']}\\Winlogbeat\\logs",
      'rotateeverybytes' => 1_048_576 # = 1MB
    },
    'level' => 'debug'
  }
}

include_recipe 'winlogbeat::default'
