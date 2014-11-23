# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
YAML.load(ERB.new(File.read('config/database.yml')).result)
run Rails.application
