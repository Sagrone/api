require 'event/organizer'

class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: 'events'

  field :title, type: String
  field :description, type: String

  embeds_one :organizer, class_name: 'Event::Organizer'

  validates :title, presence: true
  validates :description, presence: true
end
