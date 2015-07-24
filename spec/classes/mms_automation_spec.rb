require 'spec_helper'
describe 'mms_automation', :type => :class do
  context 'with defaults' do
    let(:params) { { :api_key => 'abcdefg' } }
    it { should compile }
    it { should contain_package('wget') }
    it { should contain_package('gcc') }
    it { should contain_package('perl') }
    it { should contain_file('/opt/mms-automation') }
    it { should contain_file('/etc/init.d/mongodb-automation')}
    it { should contain_exec('package-install')}
    it { should contain_exec('set-mms-server').with(
      :command => "sed -ie 's|@MMS_SERVER@|https://mms.mongodb.com|' /opt/mms-automation/automation-agent.config"
    ) }
    it { should contain_exec('set-license-key').with(
      :command => "sed -ie 's|@API_KEY@|abcdefg|' /opt/mms-automation/automation-agent.config"
    ) }
    it { should contain_service('mongodb-automation').with(
      :enable => true,
      :ensure => 'running',
    ).that_requires('File[/etc/init.d/mongodb-automation]')}
  end
  context 'with custom download_url' do
    let(:params) { {
      :api_key => 'abcdefg',
    } }
    it { should compile }
  end
  context 'with custom tmp_dir' do
    let(:params) { {
      :api_key => 'abcdefg',
      :tmp_dir => '/my/tmp'
    } }
    it { should compile }
  end
  context 'with custom mms_server' do
    let(:params) { {
      :api_key => 'abcdefg',
      :mms_server => 'custom-mms-server'
    } }
    it { should compile }
    it { should contain_exec('set-mms-server').with(
      :command => "sed -ie 's|@MMS_SERVER@|custom-mms-server|' /opt/mms-automation/automation-agent.config"
    ) }
  end
  context 'with custom mms_user' do
    let(:params) { {
      :api_key => 'abcdefg',
      :mms_user => 'my-user'
    } }
    it { should compile }
    it { should contain_user('my-user') }
    it { should contain_file('/opt/mms-automation').with(
      :owner => 'my-user',
      :group => 'my-user'
    ) }
  end
end
