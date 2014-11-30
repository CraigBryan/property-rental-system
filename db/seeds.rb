require 'fileutils'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Running db:seed will first clear everything out
User.all.each {|u| u.destroy}
Role.all.each {|r| r.destroy}
Location.all.each {|l| l.destroy}
Photo.all.each {|p| p.destroy}
Property.all.each {|p| p.destroy}
Visit.all.each {|v| v.destroy}

# Also delete uploaded files
FileUtils.rm_rf(Dir.glob(Rails.root.join('app/assets/images/uploads/*')))

# Seed the database with common values
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

au = User.new({:user_name => "kat1234", :email => "kat@gmail.com", :first_name => "kat", :last_name => "drobnjakovic", :password => "admin1234", :password_confirmation => "admin1234"} )
au.save
cu = User.new({:user_name => "craig1234", :email => "craig@gmail.com", :first_name => "craig", :last_name => "bryan", :max_rent => 700, :password => "customer1234", :password_confirmation => "customer1234"} )
cu.save
ou = User.new({:user_name => "ryan1234", :email => "ryan@gmail.com", :first_name => "ryan", :last_name => "o'conner", :password => "owner1234", :password_confirmation => "owner1234"} )
ou.save

au.add_role(a)
cu.add_role(c)
ou.add_role(o)