# Load .env variables
require 'dotenv'
Dotenv.load

# Bundler setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV.fetch('BUNDLE_GEMFILE'))
Bundler.require(:default, ENV.fetch('RACK_ENV')) if defined? Bundler

# Configure Mongoid
database_config = File.expand_path('../../config/mongoid.yml', __FILE__)
Mongoid.load!(database_config, ENV.fetch('RACK_ENV'))

# Setup load paths
root_path = File.expand_path('../../', __FILE__)
PROJECT_FOLDERS = %w( app/api app/models config )
PROJECT_FOLDERS.each { |folder| $LOAD_PATH.unshift("#{root_path}/#{folder}") }

# Application setup
require 'initializers/bson_ext'
require 'api'
