require 'event/address'
require 'event/date'
require 'event/organizer'
require 'event/origin'

class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: 'events'

  field :title, type: String
  field :summary, type: String
  field :description, type: String
  field :coordinates, type: Array
  field :tags, type: Array, default: []

  embeds_one :address, class_name: 'Event::Address'
  embeds_one :date, class_name: 'Event::Date'
  embeds_one :organizer, class_name: 'Event::Organizer'
  embeds_one :origin, class_name: 'Event::Origin'

  index({ coordinates: '2d' }, { min: -180, max: 180 })

  validates :title, presence: true
  validates :description, presence: true
end
