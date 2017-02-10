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

Restaurant.create(name: "Kinka Izakaya", address: "398 Church Street", capacity: 100, phone: "416-333-4444", description: "Trendy Japanese izakaya.", website: "http://www.kinkaizakaya.com/", user_id: 1, category_id: 2, image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/nHFVveLBqeiCGy12R2CnRA/o.jpg")
Restaurant.create(name: "Boku Sushi", address: "42 Gristmill Lane", capacity: 100, phone: "416-368-8686", description: "Sushi bar located in the Distillery District.", website: "http://bokusushi.ca/", user_id: 1, category_id: 2, image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/2GoGU_0e8_sRRI2jK7n45g/o.jpg")
Restaurant.create(name: "Bar Hop", address: "391 King Street W.", capacity: 100, phone: "647-352-7476", description: "Largest beer selection in Toronto.", website: "http://www.barhop.com/", user_id: 2, category_id: 1, image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/O0O0_yXfiATdzcmvGts12g/o.jpg")

Category.create(cuisine: "Comfort Food")
Category.create(cuisine: "Japanese")
Category.create(cuisine: "Steakhouse")
Category.create(cuisine: "Seafood")
Category.create(cuisine: "Pizzeria")
Category.create(cuisine: "Tapas")
Category.create(cuisine: "Dessert")
Category.create(cuisine: "Vegetarian")
