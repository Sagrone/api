class Event
  class Address
    include Mongoid::Document

    field :latitude, type: Float
    field :longitude, type: Float
    field :street, type: String
    field :street_number, type: String
    field :city, type: String
    field :zip, type: String
    field :region, type: String
    field :country, type: String
    field :google_map_url, type: String

    embedded_in :event, inverse_of: :address

    index({ city: 1 }, { background: true })
    index({ region: 1 }, { background: true })
  end
end
