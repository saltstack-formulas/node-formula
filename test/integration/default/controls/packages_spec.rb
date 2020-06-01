# frozen_string_literal: true

control 'nodejs package' do
  title 'should be installed'

  # Overide by platform
  package_name =
    case platform[:family]
    when 'suse'
      'nodejs10'
    else
      'nodejs'
    end

  describe package(package_name) do
    it { should be_installed }
  end
end
