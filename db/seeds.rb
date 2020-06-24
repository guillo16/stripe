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

Category.create! title: 'Backpacks'
Category.create! title: 'Luggage'
Category.create! title: 'Snow'
Category.create! title: 'Bike'


categories = Category.all.sample
colors = ['Red', 'Blue', 'Black', 'White']
puts 'creating products'

10.times do
  product.create! title: Faker::Commerce.product_name , description: Faker::Commerce.material, color: colors.sample, category_id: categories
end

puts 'finish'
