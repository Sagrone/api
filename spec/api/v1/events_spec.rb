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

  describe 'GET /v1/events/:id' do
    describe 'when event present' do
      before do
        @event = Models::Event.create!(title: 'Test Title', description: 'Test Description')

        get "v1/events/#{@event.id}"
      end

      it 'should have status 200' do
        expect_status 200
      end

      it 'should return event with correct values' do
        expect_json('event', {title: 'Test Title', description: 'Test Description'})
      end

      it 'should return event with correct types' do
        expect_json_types('event', title: :string, description: :string)
      end
    end

    describe 'when event present' do
      before do
        get "v1/events/123fake"
      end

      it 'should have status 404' do
        expect_status 404
      end

      it 'should say document not found' do
        expect_json(error: 'Document not found')
      end
    end
  end
end
