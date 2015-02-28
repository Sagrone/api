require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :console do
  sh 'irb -I . -r config/boot'
end

task :default => :spec
