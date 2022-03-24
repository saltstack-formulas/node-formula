# frozen_string_literal: true

# Overide by Platform
npmrc_file, config_prefix =
  case platform[:family]
  when 'windows'
    ['C:\\Program Files\\nodejs\\node_modules\\npm\\npmrc', '${APPDATA}\\npm']
  else
    %w[/etc/npmrc /home/vagrant/.npm-packages]
  end

root_group =
  case platform[:family]
  when 'bsd'
    'wheel'
  else
    'root'
  end

control 'node configuration' do
  title 'should match desired lines'

  describe file(npmrc_file) do
    it { should be_file }
    unless %w[windows].include?(platform[:family])
      it { should be_owned_by 'root' }
      it { should be_grouped_into root_group }
      its('mode') { should cmp '0640' }
    end
    its('content') { should include "prefix = #{config_prefix}" }
  end
end
