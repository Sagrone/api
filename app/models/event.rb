module Models
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in collection: 'events'

    field :title, type: String
    field :description, type: String

    validates :title, presence: true
    validates :description, presence: true
  end
end
