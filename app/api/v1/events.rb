require 'event'
require 'entities/event'

module API
  module V1
    class Events < Grape::API
      include API::V1::Defaults

      namespace :events do
        desc 'Return all events', {
          params: API::Entities::Event.documentation
        }
        params do
          optional :title, type: String
        end
        get nil do
          filter_params = declared(params, include_missing: false)
          events = Event.where(filter_params)
          present :events, events, with: API::Entities::Event
        end

        desc 'Return a specific event'
        get ':id' do
          event = Event.find(params[:id])
          present :event, event, with: API::Entities::Event
        end

        desc 'Create a new event'
        params do
          requires :title, type: String
          requires :description, type: String
          requires :full_address, type: String
        end
        post nil do
          event = Event.create!(declared(params))
          present :event, event, with: API::Entities::Event
        end

        desc 'Update an event'
        params do
          optional :title, type: String
          optional :description, type: String
          optional :full_address, type: String
        end
        put ':id' do
          if Event.find(params[:id]).update(declared(params))
            event = Event.find(params[:id])
            present :event, event, with: API::Entities::Event
          else
            error!("Couldn't find the event", 404)
          end
        end
      end
    end
  end
end
