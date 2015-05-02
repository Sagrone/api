require 'active_support/string_inquirer'
require 'grape'
require 'grape-entity'
require 'v1/base'

module API
  class Base < Grape::API
    mount API::V1::Base
  end

  def self.env
    @_env ||= ActiveSupport::StringInquirer.new(ENV.fetch("RACK_ENV"))
  end
end
