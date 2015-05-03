class Event
  class Date
    include Mongoid::Document

    field :start_at, type: Time
    field :end_at, type: Time

    embedded_in :event, inverse_of: :date

    index({ start_at: 1 }, { background: true })
    index({ end_at: 1 }, { background: true })
  end
end
