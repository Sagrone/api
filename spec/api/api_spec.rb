require 'spec_helper'

RSpec.describe API do
  describe 'API::Base' do
    it 'should be defined' do
      expect(described_class).to_not be_nil
    end
  end

  describe 'self.env' do
    it 'should be test' do
      expect(described_class.env).to eq('test')
    end
  end
end
