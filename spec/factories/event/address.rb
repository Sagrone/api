FactoryGirl.define do
  factory :event_address, class: 'Event::Address', aliases: [:address] do
    event
    latitude { Faker::Sagra.latitude }
    longitude { Faker::Sagra.longitude }
    street { Faker::Sagra.street_name }
    street_number  { Faker::Sagra.street_number }
    city { Faker::Sagra.city }
    zip { Faker::Sagra.zip }
    region { Faker::Sagra.region }
    country { Faker::Sagra.country }
    google_map_url { "http://maps.google.com/maps?q=#{latitude},#{longitude}" }
  end
end
