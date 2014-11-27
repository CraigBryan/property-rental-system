# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.all.each {|u| u.destroy}
Role.all.each {|r| r.destroy}
Location.all.each {|l| l.destroy}

Location.new(:name => "Downtown").save
Location.new(:name => "Lowertown").save
Location.new(:name => "Byward Market").save
Location.new(:name => "South Keys").save
Location.new(:name => "Orleans").save
Location.new(:name => "Nepean").save
Location.new(:name => "Kanata").save

a = Role.new(:name => "admin")
a.save
c = Role.new(:name => "customer")
c.save
o = Role.new(:name => "owner")
o.save

au = User.new({:email => "kat@gmail.com", :password => "admin1234", :password_confirmation => "admin1234"} )
au.save
cu = User.new({:email => "craig@gmail.com", :password => "customer1234", :password_confirmation => "customer1234"} )
cu.save
ou = User.new({:email => "ryan@gmail.com", :password => "owner1234", :password_confirmation => "owner1234"} )
ou.save

au.add_role(a)
cu.add_role(c)
ou.add_role(o)