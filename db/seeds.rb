# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'clearing database'

LineItem.delete_all
Cart.delete_all
Product.delete_all
Category.delete_all

puts 'creating category'

backpack = Category.create! title: 'Backpacks'
luggage = Category.create! title: 'Wheeled Luggage'
snow = Category.create! title: 'Snow'
bike = Category.create! title: 'Bike'
accessories = Category.create! title: 'Accessories'
photography = Category.create! title: 'Photography'


colors = ['Red', 'Blue', 'Black', 'White']
puts 'creating products'

4.times do
  Product.create! title: 'The Backpack' , price: 189, description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

4.times do
  Product.create! title: 'The Backpack Pro' , price: 199, description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

4.times do
  Product.create! title: 'The Hugger 30L' , price: 169, description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

4.times do
  Product.create! title: 'The Hugger 60L' , price: 179, description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

4.times do
  Product.create! title: 'The Petite' , price: 159, description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

puts 'finish'
