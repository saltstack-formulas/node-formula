# frozen_string_literal: true

title 'node archives profile'

control 'node source archive' do
  impact 1.0
  title 'should be installed'

  describe file('/opt/local/bin/node') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end
