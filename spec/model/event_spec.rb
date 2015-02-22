require 'spec_helper'
require 'models/event'

RSpec.describe Models::Event do
  it 'should be defined' do
    expect(described_class).to_not be_nil
  end
end
