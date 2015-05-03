module API
  module Entities
    class Event < Grape::Entity
      expose :id, documentation: 'Event id'
      expose :title, documentation: 'Event title'
      expose :description, documentation: 'Event description'
      expose :full_address, documentation: 'Event full address'
    end
  end
end
