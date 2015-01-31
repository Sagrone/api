ENV['RACK_ENV'] = 'test'

Bundler.require

require 'airborne'
require 'rspec'

Airborne.configure do |config|
  config.rack_app = API
end

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = :expect
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.full_backtrace = false
end
