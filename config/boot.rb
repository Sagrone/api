# Load .env variables
require 'dotenv'
Dotenv.load

# Bundler setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV.fetch('BUNDLE_GEMFILE'))
Bundler.require(:default, ENV.fetch('RACK_ENV')) if defined? Bundler

LOAD_PATHS = %w(
  ../../config/initializers/**/*.rb
)

def require_files(paths)
  paths.each do |path|
    files = Dir[File.expand_path(path, __FILE__)]
    files.each do |file|
      dirname = File.dirname(file)
      file_basename = File.basename(file, File.extname(file))
      require "#{dirname}/#{file_basename}"
    end
  end
end

require_files(LOAD_PATHS)

# Configure Mongoid
database_config = File.expand_path('../../config/mongoid.yml', __FILE__)
Mongoid.load!(database_config, ENV.fetch('RACK_ENV'))

# Application setup
require File.expand_path('../../app/api',  __FILE__)
