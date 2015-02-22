require 'active_support/string_inquirer'

module API
  def self.env
    @_env ||= ActiveSupport::StringInquirer.new(ENV["RACK_ENV"] || "development")
  end
end
