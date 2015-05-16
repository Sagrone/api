require 'spec_helper'

RSpec.describe API do
  describe API::Base do
  end

  describe 'self.env' do
    it 'should be test' do
      expect(described_class.env).to eq('test')
    end
  end

  describe 'self.root' do
    it 'should be the root project folder' do
      project_folder = File.expand_path('../../../', __FILE__)

      expect(described_class.root).to eq(project_folder)
    end
  end
end
