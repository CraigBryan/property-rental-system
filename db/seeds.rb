# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Adding locations to system
Location.new(:name => "Downtown").save
Location.new(:name => "Lowertown").save
Location.new(:name => "Byward Market").save
Location.new(:name => "South Keys").save
Location.new(:name => "Orleans").save
Location.new(:name => "Nepean").save
Location.new(:name => "Kanata").save