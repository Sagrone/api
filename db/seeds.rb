puts 'Seed events...'

events = YAML.load_file(File.expand_path('../events.yml', __FILE__))
events.each do |event_attrs|
  Event.create!(event_attrs)
end

puts 'Done'
