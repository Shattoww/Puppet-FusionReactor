require 'spec_helper'
describe 'fusionreactor' do

  context 'with defaults for all parameters' do
    it { should contain_class('fusionreactor') }
  end
end
