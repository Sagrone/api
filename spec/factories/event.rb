FactoryGirl.define do
  factory :event do
    title { Faker::Sagra.title }
    description { Faker::Sagra.description }
    full_address { Faker::Sagra.full_address }
  end

  trait :full_details do
    organizer { FactoryGirl.build(:organizer) }
    coordinates { Faker::Sagra.coordinates }
    date { FactoryGirl.build(:date) }
    address { FactoryGirl.build(:address) }
    tags { Faker::Sagra.tags }
    origin { FactoryGirl.build(:origin) }
    images { FactoryGirl.build_list(:image, 5) }
  end
end
