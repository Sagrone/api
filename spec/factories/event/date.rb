FactoryGirl.define do
  factory :event_date, class: 'Event::Date', aliases: [:date] do
    start_at { Faker::Date.between(2.days.ago, 5.days.from_now) }
    end_at { Faker::Date.between(5.days.from_now, 10.days.from_now) }
  end
end
