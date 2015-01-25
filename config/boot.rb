# Bundler setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV.fetch('BUNDLE_GEMFILE'))
Bundler.require(:default, ENV.fetch('RACK_ENV')) if defined? Bundler
