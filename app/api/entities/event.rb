module API
  module Entities
    class Event < Grape::Entity
      expose :id, documentation: 'Event id'
      expose :title, documentation: 'Event title'
      expose :description, documentation: 'Event description'
    end
  end
end
