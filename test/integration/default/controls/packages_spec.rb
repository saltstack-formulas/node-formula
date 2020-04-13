# frozen_string_literal: true

control 'nodejs package' do
  title 'should be installed'

  describe package('nodejs') do
    it { should be_installed }
  end
end
