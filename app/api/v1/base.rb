require 'api/v1/defaults'
require 'api/v1/status'
require 'api/v1/events'

module API
  module V1
    class Base < Grape::API
      include API::V1::Defaults

      mount API::V1::Status
      mount API::V1::Events
    end
  end
end
