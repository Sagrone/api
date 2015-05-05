FactoryGirl.define do
  factory :event do
    title { Faker::Sagra.title }
    description { Faker::Sagra.description }
    full_address { Faker::Sagra.full_address }
  end

  trait :full_details do
    organizer { Faker::Sagra.organizer }
    coordinates { Faker::Sagra.coordinates }
    date { Faker::Sagra.date }
    address { Faker::Sagra.address }
    tags { Faker::Sagra.tags }
    origin { Faker::Sagra.origin }
    images { Faker::Sagra.images }
  end
end
