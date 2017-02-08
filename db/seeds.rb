# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: "Kinka Izakaya", address: "123 Toronto Road", capacity: 100, phone: "416-333-4444", description: "Trendy Japanese izakaya.", website: "http://www.kinkaizakaya.com/", owner_id: 1, category_id: 1)
Restaurant.create(name: "Bar Hop", address: "321 Toronto Road", capacity: 100, phone: "416-332-4254", description: "Largest beer selection in Toronto.", website: "http://www.barhop.com/", owner_id: 2, category_id: 2)
