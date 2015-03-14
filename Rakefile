require 'rake'
require './lib/wimdu.rb'
require './db/migrations/001_create_properties.rb'

task default: :create_properties

task :create_properties do
  CreateProperties.migrate(:up)
end
