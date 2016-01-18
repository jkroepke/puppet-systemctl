require 'spec_helper'
describe 'systemctl' do

  context 'with defaults for all parameters' do
    it { should contain_class('systemctl') }
  end
end
