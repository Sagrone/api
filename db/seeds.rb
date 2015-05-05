require_relative '../spec/support/faker/sagra'
require_relative '../spec/support/factory_girl/definitions'

EVENT_COUNT = 20

puts "Create #{EVENT_COUNT} events with random data..."

FactoryGirl.create_list(:event, EVENT_COUNT, :full_details)

puts 'Done'
