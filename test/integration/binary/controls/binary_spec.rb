# frozen_string_literal: true

title 'node archives profile'

control 'node binary archive' do
  impact 1.0
  title 'should be installed'

  describe file('/usr/local/bin/node') do
    it { should exist }
  end
end
