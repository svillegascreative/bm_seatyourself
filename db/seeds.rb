# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

prudence = User.create(:name => "Prudence", :password => "pru", :email => "prudence@gmail.com")
max = User.create(:name => "Max", :password => "max", :email => "max@gmail.com")
oliver = User.create(:name => "Oliver", :password => "ollie", :email => "oliver@gmail.com")
sarah = User.create(:name => "Sarah", :password => "couscous", :email => "sarah@gmail.com")
