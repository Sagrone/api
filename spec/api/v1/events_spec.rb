require 'spec_helper'

RSpec.describe API::V1::Events do
  it 'should be defined' do
    expect(described_class).to_not be_nil
  end

  describe 'GET /v1/events' do
    it 'should have status 200' do
      get 'v1/events'
      expect_status 200
    end
  end
end
