# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = Role.new(:name => "admin")
a.save
c = Role.new(:name => "customer")
c.save
o = Role.new(:name => "owner")
o.save

au = User.new({:email => "kat.drobnjakovic@gmail.com", :password => "admin1234", :password_confirmation => "admin1234"} )
au.save
cu = User.new({:email => "craig@gmail.com", :password => "customer1234", :password_confirmation => "customer1234"} )
cu.save
ou = User.new({:email => "ryan@gmail.com", :password => "owner1234", :password_confirmation => "owner1234"} )
ou.save

au.add_role(a)
cu.add_role(c)
ou.add_role(o)
