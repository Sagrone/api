require 'airborne'

Airborne.configure do |config|
  config.rack_app = API::Base
end
