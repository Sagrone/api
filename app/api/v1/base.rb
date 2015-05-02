require 'v1/defaults'
require 'v1/status'
require 'v1/events'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Status
      mount API::V1::Events
    end
  end
end
