require 'models/event'
require 'api/entities/event'

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
          events = Models::Event.where(filter_params)
          present :events, events, with: API::Entities::Event
        end

        desc 'Return a specific event'
        get ':id' do
          event = Models::Event.find(params[:id])
          present :event, event, with: API::Entities::Event
        end

        desc 'Create a new event'
        params do
          requires :title, type: String
          requires :description, type: String
        end
        post nil do
          event = Models::Event.create!(declared(params))
          present :event, event, with: API::Entities::Event
        end
      end
    end
  end
end
