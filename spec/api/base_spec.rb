require 'spec_helper'

RSpec.describe API::Base do
  it 'should be defined' do
    expect(described_class).to_not be_nil
  end
end
