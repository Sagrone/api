require 'spec_helper'
require 'models/event'

RSpec.describe API::V1::Events do
  it 'should be defined' do
    expect(described_class).to_not be_nil
  end

  describe 'GET /v1/events' do
    it 'should have status 200' do
      get 'v1/events'
      expect_status 200
    end

    describe 'with three events present' do\
      before do
        3.times do |num|
          Models::Event.create!({
            title: "Title #{num}",
            description: "Description #{num}"
          })
        end
        get 'v1/events'
      end

      it 'should return three events as json' do
        expect_json_sizes(events: 3)
      end

      it 'should have fields with correct types' do
        expect_json_types('events.*', {title: :string, description: :string})
      end

      it 'first event returned has correct values' do
        expect_json('events.0', {title: 'Title 0', description: 'Description 0'})
      end

      it 'last event returned has correct values' do
        expect_json('events.2', {title: 'Title 2', description: 'Description 2'})
      end
    end
  end
end
