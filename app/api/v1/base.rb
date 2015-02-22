require 'api/v1/defaults'
require 'api/v1/status'

module API
  module V1
    class Base < Grape::API
      include API::V1::Defaults

      mount API::V1::Status
    end
  end
end
