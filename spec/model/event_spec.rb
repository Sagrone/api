require 'spec_helper'
require 'models/event'

RSpec.describe Models::Event do
  it 'should be defined' do
    expect(described_class).to_not be_nil
  end

  it { is_expected.to be_mongoid_document }
  it { is_expected.to be_timestamped_document }
end
