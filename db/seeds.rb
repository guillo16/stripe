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

backpack = Category.create! title: 'Backpacks',
photo: '',
photo_secondary: 'https://res.cloudinary.com/dmbom1kyl/image/upload/v1593288369/Backpack_index_utwqfr.jpg'
luggage = Category.create! title: 'Wheeled Luggage',
photo: 'https://res.cloudinary.com/dmbom1kyl/image/upload/v1593288407/Product-luggage_hlqvzi.jpg',
photo_secondary: ''
snow = Category.create! title: 'Snow',
photo: 'https://res.cloudinary.com/dmbom1kyl/image/upload/c_scale,w_1382/v1593288417/snow_product_b4qpvy.jpg',
photo_secondary: 'https://res.cloudinary.com/dmbom1kyl/image/upload/c_scale,w_608/v1593271280/oskarbakke_japan_DSC7538-Redigera-2_wmfdlr.jpg'
bike = Category.create! title: 'Bike',
photo: 'https://res.cloudinary.com/dmbom1kyl/image/upload/c_scale,w_1353/v1593288378/Bike_product_vj4xsr.jpg',
photo_secondary: 'https://res.cloudinary.com/dmbom1kyl/image/upload/c_scale,w_653/v1593271267/8h5b3277-edit_tznask.jpg'
accessories = Category.create! title: 'Accessories',
photo: 'https://res.cloudinary.com/dmbom1kyl/image/upload/v1593288368/accessories_product_ykhicc.jpg',
photo_secondary: ''
photography = Category.create! title: 'Photography',
photo: '',
photo_secondary: ''


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
