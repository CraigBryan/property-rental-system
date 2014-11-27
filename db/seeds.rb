# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Role.new(:name => "admin")
r.save

u = User.new({:email => "kat.drobnjakovic@gmail.com", :password => "admin1234", :password_confirmation => "admin1234"} )
u.save

u.add_role(r)
