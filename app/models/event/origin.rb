class Event
  class Origin
    include Mongoid::Document

    field :name, type: String
    field :code_name, type: String
    field :website, type: String
    field :page_url, type: String

    embedded_in :event, inverse_of: :origin
  end
end
