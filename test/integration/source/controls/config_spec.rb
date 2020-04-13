# frozen_string_literal: true

control 'node configuration' do
  title 'should match desired lines'

  describe file('/etc/npmrc') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0640' }
    its('content') { should include 'prefix = /home/vagrant/.npm-packages' }
  end
end
