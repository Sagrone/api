FactoryGirl.define do
  factory :event_organizer, class: 'Event::Organizer', aliases: [:organizer] do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.url }
  end
end
