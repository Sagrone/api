class Event
  class Image
    include Mongoid::Document

    field :title, type: String, default: ''
    field :url, type: String
    field :width, type: Integer
    field :height, type: Integer

    embedded_in :event, inverse_of: :images

    validates :url, presence: true
  end
end
