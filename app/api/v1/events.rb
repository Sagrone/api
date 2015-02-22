require 'models/event'
require 'api/entities/event'

module API
  module V1
    class Events < Grape::API
      include API::V1::Defaults

      desc 'Return all events', {
        params: API::Entities::Event.documentation
      }
      namespace :events do
        get nil do
          events = Models::Event.all
          present :events, events, with: API::Entities::Event
        end
      end
    end
  end
end
