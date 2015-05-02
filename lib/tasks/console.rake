desc 'Open API console'
task :console do
  sh 'irb -I . -r config/boot'
end
