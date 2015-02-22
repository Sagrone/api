require 'api/formatters/json_error'

module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1'
        content_type :json, 'application/json; charset=UTF-8'
        format :json
        error_formatter :json, API::Formatters::JsonError

        rescue_from Mongoid::Errors::DocumentNotFound do |_|
          error_response(message: "Document not found", status: 404)
        end

        rescue_from Mongoid::Errors::Validations do |error|
          extracted = error.message.match /(?<message>The following errors were found:.*\n)/
          error_response(message: extracted[:message], status: 400)
        end

        rescue_from Grape::Exceptions::ValidationErrors do |error|
          error_response(message: error.message, status: 400)
        end

        rescue_from :all do |error|
          if API.env.development? || API.env.test?
            raise error
          else
            error_response(message: "Internal server error", status: 500)
          end
        end
      end
    end
  end
end
