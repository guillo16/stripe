# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'clearing database'

Product.delete_all
Category.delete_all

puts 'creating category'

backpack = Category.create! title: 'Backpacks'
Category.create! title: 'Luggage'
Category.create! title: 'Snow'
Category.create! title: 'Bike'


colors = ['Red', 'Blue', 'Black', 'White']
puts 'creating products'

5.times do
  Product.create! title: 'The Backpack' , description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

5.times do
  Product.create! title: 'The Backpack Pro' , description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

5.times do
  Product.create! title: 'The hugger' , description: 'Very nice', color: colors.sample, category: backpack, stock: 10
end

puts 'finish'
