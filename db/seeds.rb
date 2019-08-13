# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Destroy DB
Recipe.destroy_all
User.destroy_all
#Create User
user = User.create(email:"someguy@email.com", password:"password")

#Create sandwich recipe
sandwich = Recipe.create(
  name: "Sandwich",
  ingredients: "Bread\r\nCheese\r\nHam",
  instructions: "Put cheese and ham on the bread",
  category: "sandwhich",
  author: "Bob",
  user: user
)

sandwich.image.attach(io: File.open(Rails.root.join('public', 'background.png')), filename: 'background.png')

#Create banana smoothie
banana_smoothie = Recipe.create(
  name: "Banana smoothie",
  ingredients: "Banana\r\nMilk\r\nSugar",
  instructions: "Put banana, milk, and sugar in the blender and enjoy",
  category: "Smoothie",
  author: "bobby",
  user: user
)

banana_smoothie.image.attach(io: File.open(Rails.root.join('public', 'background.png')), filename: 'background.png')

#Create chicken recipe
chicken = Recipe.create(
  name: "Chicken",
  ingredients: "Chicken\r\nOnion\r\nPowder\r\nGarlic Powder\r\nSalt Pepper",
  instructions: "Add seasoning to chicken\r\nCook chicken",
  category: "Poultry",
  author: "johnny m",
  user: user
)

chicken.image.attach(io: File.open(Rails.root.join('public', 'background.png')), filename: 'background.png')

#Create mac and cheese recipe
mac_and_cheese = Recipe.create(
  name: "Mac and Cheese",
  ingredients: "Mac\r\nCheese\r\nFlour\r\nSalt\r\nPepper",
  instructions: "Cook Pasta\r\nBoil Milk\r\nAdd dry ingrediant and cheese",
  category: "Pasta",
  author: "Bob",
  user: user
)

mac_and_cheese.image.attach(io: File.open(Rails.root.join('public', 'background.png')), filename: 'background.png')

#Display in the console when create
puts "#{Recipe.count} recipes"
puts "#{User.count} users"
