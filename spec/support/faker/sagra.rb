require 'faker'

module Faker
  module Sagra
    def self.title
      num_edition = (1..20).to_a.sample
      "Sagra della #{sagre_examples.sample} #{num_edition} edizione"
    end

    def self.description
      Faker::Lorem.paragraph(10)
    end

    def self.latitude
      Faker::Address.latitude.to_f
    end

    def self.longitude
      Faker::Address.longitude.to_f
    end

    def self.coordinates
      [latitude, longitude]
    end

    def self.date
      {
        start_at: Faker::Date.between(2.days.ago, 5.days.from_now),
        end_at: Faker::Date.between(5.days.from_now, 10.days.from_now),
      }
    end

    def self.full_address
      "#{street_name}, #{street_number}, #{city}, #{region}"
    end

    def self.street_name
      Faker::Address.street_name
    end

    def self.street_number
      Faker::Number.number(2)
    end

    def self.city
      Faker::Address.city
    end

    def self.zip
      Faker::Address.zip
    end

    def self.region
      regions_examples.sample
    end

    def self.country
      'Italy'
    end

    def self.tags
      tags_examples.shuffle.take(3)
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

    private

    def self.sagre_examples
      @_sagre_examples ||= %w(patata uva polenta seppia castagna noce mela)
    end

    def self.regions_examples
      @_regions_examples ||= %w(Piemonte Lombardia Veneto Liguria)
    end

    def self.tags_examples
      @_tags_examples ||= %w(funghi costine musica tombola sorpresa beneficenza)
    end
  end
end
