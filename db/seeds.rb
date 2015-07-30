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
 55.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 wikis = Wiki.all

  #Create an admin user
  admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a member 1
 member = User.new(
   name:     'Member User1',
   email:    'member1@example.com',
   password: 'helloworld',
   role:     'standard'
 )
 member.skip_confirmation!
 member.save!

 # Create a member 2
 member = User.new(
   name:     'Member User2',
   email:    'member2@example.com',
   password: 'helloworld',
   role:     'standard'
 )
 member.skip_confirmation!
 member.save!
 
  # Create a member 3
 member = User.new(
   name:     'Member User3',
   email:    'member3@example.com',
   password: 'helloworld',
   role:     'standard'
 )
 member.skip_confirmation!
 member.save!

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} user created"