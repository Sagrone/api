FactoryGirl.define do
  factory :event_image, class: 'Event::Image', aliases: [:image] do
    event
    title { Faker::Name.title }
    url { "http://placehold.it/#{width}x#{height}" }
    width '270'
    height '160'
  end
end
