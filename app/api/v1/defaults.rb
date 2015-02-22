module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1'
        content_type :json, 'application/json; charset=UTF-8'
        format :json

        rescue_from Mongoid::Errors::DocumentNotFound do |_|
          error_response(message: "Document not found", status: 404)
        end

        rescue_from :all do |error|
          if API.env.development?
            raise error
          else
            error_response(message: "Internal server error", status: 500)
          end
        end
      end
    end
  end
end
