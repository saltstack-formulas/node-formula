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

  describe file('/etc/default/node.sh') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into root_group }
    its('mode') { should cmp '0640' }
  end
end
