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

  # Project root folder
  def self.root
    @_root ||= File.expand_path('../../../', __FILE__)
  end
end
