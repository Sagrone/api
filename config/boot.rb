# Bundler setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV.fetch('BUNDLE_GEMFILE'))
Bundler.require(:default, ENV.fetch('RACK_ENV')) if defined? Bundler

# Load .env variables
Dotenv.load

# Require initializers
initializer_files = Dir[File.expand_path('../../config/initializers/**/*.rb', __FILE__)]
initializer_files.each do |file|
  dirname = File.dirname(file)
  file_basename = File.basename(file, File.extname(file))
  require "#{dirname}/#{file_basename}"
end

# Configure Mongoid
database_config = File.expand_path('../../config/mongoid.yml', __FILE__)
Mongoid.load!(database_config, ENV.fetch('RACK_ENV'))

# Application setup
require File.expand_path('../../app/api',  __FILE__)
