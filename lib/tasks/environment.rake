desc 'Load environment: useful for other tasks'
task :environment do
  require File.expand_path('../../../config/boot', __FILE__)
end
