ENV['RACK_ENV'] = 'test'

Bundler.require

require 'airborne'
require 'rspec'

require_relative '../config/boot'

Airborne.configure do |config|
  config.rack_app = API::Base
end

RSpec.configure do |config|
  config.include Mongoid::Matchers, type: :model

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.full_backtrace = false
  config.order = :random
end
