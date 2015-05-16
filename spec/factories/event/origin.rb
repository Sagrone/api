FactoryGirl.define do
  factory :event_origin, class: 'Event::Origin', aliases: [:origin] do
    event
    name 'example.com'
    code_name 'example.com'
    website { Faker::Internet.url('example.com', '/') }
    page_url { Faker::Internet.url('example.com') }
  end
end
