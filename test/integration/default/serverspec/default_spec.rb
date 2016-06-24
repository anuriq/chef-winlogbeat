require 'spec_helper'

describe 'Winlogbeat' do
  it 'is running as a service' do
    expect(service('winlogbeat')).to be_running
  end

  it 'is enabled as a service' do
    expect(service('winlogbeat')).to have_start_mode('Automatic')
  end

  it 'has a configuration file' do
    expect(file('C:\\Program Files\\Winlogbeat\\winlogbeat.yml')).to be_file
  end

  it 'has a registry file' do
    expect(file('C:\\ProgramData\\Winlogbeat\\.winlogbeat.yml')).to be_file
  end

  it 'has a log file' do
    expect(file('C:\\ProgramData\\Winlogbeat\\logs\\winlogbeat')).to be_file
  end
end
