require 'faker'

EVENT_COUNT = 20

puts "Create #{EVENT_COUNT} events with random data..."

module Faker
  module Sagra
    SAGRE = %w(patata uva polenta seppia castagna noce mela)
    REGIONS = %w(Piemonte Lombardia Veneto Liguria)
    TAGS = %w(funghi costine musica tombola sorpresa beneficenza)

    def self.title
      num_edition = (1..20).to_a.sample
      "Sagra della #{SAGRE.sample} #{num_edition} edizione"
    end

    def self.region
      REGIONS.sample
    end

    def self.tags
      TAGS.shuffle.take(3)
    end

    def self.images(count = 5)
      count.times.inject([]) do |result|
        image = {
          title: Faker::Name.title,
          url: 'http://placehold.it/270x160',
          width: '270',
          height: '160'
        }

        result.push(image)
      end
    end
  end
end

def random_event_attrs
  lat = Faker::Address.latitude.to_f
  lon = Faker::Address.longitude.to_f

  street_name = Faker::Address.street_name
  street_number = Faker::Number.number(2)
  city = Faker::Address.city
  zip = Faker::Address.zip
  region = Faker::Sagra.region
  country = "Italy"

  full_address = "#{street_name}, #{street_number}, #{city}, #{region}"

  origin_name = 'example.com'
  origin_website = Faker::Internet.url('example.com', '/')
  origin_page_url = Faker::Internet.url('example.com')

  {
    title: Faker::Sagra.title,
    description: Faker::Lorem.paragraph(10),
    organizer: {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      website: Faker::Internet.url
    },
    coordinates: [lat, lon],
    date: {
      start_at: Faker::Date.between(2.days.ago, 5.days.from_now),
      end_at: Faker::Date.between(5.days.from_now, 10.days.from_now),
    },
    full_address: full_address,
    address: {
      latitude: lat,
      longitude: lon,
      street: street_name,
      street_number: street_number,
      city: city,
      zip: zip,
      region: region,
      country: country,
      google_map_url: "http://maps.google.com/maps?q=#{lat},#{lon}"
    },
    tags: Faker::Sagra.tags,
    origin: {
      name: origin_name,
      code_name: origin_name,
      website: origin_website,
      page_url: origin_page_url
    },
    images: Faker::Sagra.images
  }
end

EVENT_COUNT.times do
  Event.create!(random_event_attrs)
end

puts 'Done'
