# frozen_string_literal: true

# Overide by Platform
root_group =
  case platform[:family]
  when 'bsd'
    'wheel'
  else
    'root'
  end

control 'node configuration environment' do
  title 'should match desired lines'

  only_if('Environment file not managed on Windows') do
    !%w[windows].include?(system.platform[:name])
  end

  describe file('/etc/default/node.sh') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into root_group }
    its('mode') { should cmp '0640' }
  end
end
