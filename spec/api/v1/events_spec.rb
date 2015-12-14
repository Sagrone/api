require 'spec_helper'

RSpec.describe API::V1::Events do
  describe 'GET /v1/events' do
    it 'should have status 200' do
      get 'v1/events'
      expect_status 200
    end

    describe 'with three events present' do\
      before do
        @events = 3.times.map do |num|
                    create(:event, {
                      title: "Title #{num}",
                      description: "Description #{num}",
                      full_address: 'Full address #{num}'
                    })
                  end
      end

      describe 'get all events' do
        before do
          get 'v1/events'
        end

        it 'should return three events as json' do
          expect_json_sizes(events: 3)
        end

        it 'should have fields with correct types' do
          expect_json_types('events.*', {id: :string, title: :string, description: :string})
        end

        it 'first event returned has correct values' do
          expect_json('events.0', {id: @events[0].id.to_s, title: 'Title 0', description: 'Description 0'})
        end

        it 'last event returned has correct values' do
          expect_json('events.2', {id: @events[2].id.to_s, title: 'Title 2', description: 'Description 2'})
        end
      end

      describe 'filter by title' do
        before do
          get 'v1/events?title=Title+1'
        end

        it 'should return one event with matching title' do
          expect_json_sizes(events: 1)
          expect_json('events.0', {id: @events[1].id.to_s, title: 'Title 1', description: 'Description 1'})
        end
      end
    end
  end

  describe 'GET /v1/events/:id' do
    describe 'when event present' do
      before do
        @event = create(:event, title: 'Test Title', description: 'Test Description', full_address: 'Test address')

        get "v1/events/#{@event.id}"
      end

      it 'should have status 200' do
        expect_status 200
      end

      it 'should return event with correct values' do
        expect_json('event', {id: @event.id.to_s, title: 'Test Title', description: 'Test Description'})
      end

      it 'should return event with correct types' do
        expect_json_types('event', id: :string, title: :string, description: :string)
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
        expect_json(error_message: 'Document not found')
      end
    end
  end

  describe 'PUT /v1/event/:id' do
    describe 'when event is missing' do
      before do
        put 'v1/events/123', {title: "Test Title"}
      end

      it 'should return an error' do
        expect_status 404
      end
    end

    describe 'when event exists and params are wrong' do
      before do
        @event = create(:event,
                        title: 'Test Title',
                        description: 'Test Description',
                        full_address: 'Full Address')
        put "v1/events/#{@event.id}", title: 123
      end

      it 'return an error about the title' do
        expect_status 404
        expect_json('error_message', "Couldn't find the event")
      end
    end

    describe 'when event exists and params are present' do
      before do
        @event = create(
          :event,
          title: 'Test Title',
          description: 'Test Description',
          full_address: 'Full Address'
        )
        put "v1/events/#{@event.id}",
            title: 'Updated Title',
            description: 'Updated Description',
            full_address: 'Updated Full Address'
      end

      it 'should have updated values' do
        expect_status 200
        expect_json('event.title', 'Updated Title')
        expect_json('event.description', 'Updated Description')
        expect_json('event.full_address', 'Updated Full Address')
      end
    end
  end

  describe 'POST /v1/events' do
    describe 'when params present' do
      before do
        @event_attrs = {title: 'Test Title', description: 'Test Description', full_address: 'Test Address'}
      end

      describe 'empty values passed' do
        before do
          post 'v1/events', { title: '', description: '', full_address: ''}
        end

        it 'should not increase events count' do
          expect(Event.count).to eq 0
        end

        it 'should return status 400' do
          expect_status 400
        end

        it 'should return field validation error messages' do
          expect_json('error_message', "Title can't be blank")
          expect_json('error_message', "Description can't be blank")
          expect_json('error_message', "Full address can't be blank")
        end
      end

      it 'increment existing events count by one' do
        expect(Event.count).to eq 0
        post 'v1/events', @event_attrs
        expect(Event.count).to eq 1
      end

      it 'create new event with title and description' do
        post 'v1/events', @event_attrs
        event = Event.first
        expect(event.id).to be
        expect(event.title).to eq 'Test Title'
        expect(event.description).to eq 'Test Description'
        expect(event.full_address).to eq 'Test Address'
      end
    end

    describe 'params missing' do
      it 'without required params' do
        post 'v1/events', { }
        expect(Event.count).to eq 0
        expect_json(error_message: 'title is missing, description is missing, full_address is missing')
      end
    end
  end
end
