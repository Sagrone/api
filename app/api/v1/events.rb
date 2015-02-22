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
        get nil do
          events = Models::Event.all
          present :events, events, with: API::Entities::Event
        end

        desc 'Return a specific event'
        get ':id' do
          event = Models::Event.find(params[:id])
          present :event, event, with: API::Entities::Event
        end
      end
    end
  end
end
