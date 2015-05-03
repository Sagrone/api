class Event
  class Organizer
    include Mongoid::Document

    field :email, type: String
    field :name, type: String
    field :phone, type: String
    field :website, type: String

    embedded_in :event, inverse_of: :organizer
  end
end
