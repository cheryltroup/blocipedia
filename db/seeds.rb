# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'faker'
 
 # Create Wikis
 50.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 wikis = Wiki.all

 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!

 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld',
   role:     'standard'
 )
 member.skip_confirmation!
 member.save!

 
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} user created"