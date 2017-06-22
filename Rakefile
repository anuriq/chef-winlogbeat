#!/usr/bin/env rake

require 'foodcritic'
require 'chef-dk/cli'
require 'cookstyle'
require 'kitchen/rake_tasks'
require 'rubocop/rake_task'

# Style tests. Cookstyle (rubocop) and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any'],
      progress: true,
    }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each(&:destroy)
    Kitchen::Config.new.instances.each(&:converge)
    Kitchen::Config.new.instances.each(&:verify)
    Kitchen::Config.new.instances.each(&:destroy)
  end
end

# Default
task default: ['style', 'integration:vagrant']
