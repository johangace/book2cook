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
user = User.create(email:"bob@gmail.com", password:"password")

#Create sandwich recipe
sandwich = Recipe.create(
  name: "Sandwich",
  ingredients: "Bread\r\nCheese\r\nHam",
  instructions: "Put cheese and ham on the bread",
  category: "sandwich",
  author: "Bob",
  user_id: user.id
)

sandwich.image.attach(io: File.open(Rails.root.join('public', 'sandwich.jpeg')), filename: 'sandwich.jpeg')

#Create banana smoothie
banana_smoothie = Recipe.create(
  name: "Banana smoothie",
  ingredients: "Banana\r\nMilk\r\nSugar",
  instructions: "Put banana, milk, and sugar in the blender and enjoy\r\nWhen its all well blended, pour it in a cup",
  category: "Smoothie",
  author: "bob",
  user_id: user.id
)

banana_smoothie.image.attach(io: File.open(Rails.root.join('public', 'bananaSmothie.jpeg')), filename: 'bananaSmothie.jpeg')

#Create chicken recipe
chicken = Recipe.create(
  name: "Chicken",
  ingredients: "Chicken\r\nOnion\r\nPowder\r\nGarlic Powder\r\nSalt Pepper",
  instructions: "Add seasoning to chicken\r\nCook chicken",
  category: "Poultry",
  author: "bob",
  user_id: user.id
)

chicken.image.attach(io: File.open(Rails.root.join('public', 'chicken.jpeg')), filename: 'chicken.jpeg')

#Create mac and cheese recipe
mac_and_cheese = Recipe.create(
  name: "Mac and Cheese",
  ingredients: "Mac\r\nCheese\r\nFlour\r\nSalt\r\nPepper",
  instructions: "Cook Pasta\r\nBoil Milk\r\nAdd dry ingrediant and cheese",
  category: "Pasta",
  author: "Bob",
  user_id: user.id
)

mac_and_cheese.image.attach(io: File.open(Rails.root.join('public', 'MacCheese.jpg')), filename: 'MacCheese.jpg')

#Create pancake recipe
fluffy_pancakes = Recipe.create(
  name: "Fluffy Pancakes",
  ingredients: "Milk\r\nBaking powder\r\nBaking soda\r\nEggs\r\nButter\r\nFlour\r\nSalt\r\nPepper",
  instructions: "Combine dry ingrediant \r\nAdd Milk\r\nHeat it into the skillet",
  category: "Pancake",
  author: "Bob",
  user_id: user.id
)

fluffy_pancakes.image.attach(io: File.open(Rails.root.join('public', 'pancake.jpg')), filename: 'pancake.jpg')

#Create cookies recipe
Cookies = Recipe.create(
  name: "Cookies",
  ingredients: "Flour\r\nKosher salt\r\nWhite sugar\r\nEggs\r\nBrown sugar\r\nMilk\r\nChocalate chips\r\nVanilla extract",
  instructions: "Combine dry ingrediant \r\nMix dry ingrediant with wet ingrediante\r\nAdd chocalate chips\r\nPut it in the oven at 375 degree\r\nPull out when done",
  category: "Deserts",
  author: "Bob",
  user_id: user.id
)

Cookies.image.attach(io: File.open(Rails.root.join('public', 'cookies.jpeg')), filename: 'cookies.jpg')

#Create california grilled veggie sandwich recipe
California_sandwich = Recipe.create(
  name: "California Grilled Veggie Sandwich",
  ingredients: "Mayonnaise\r\nGarlic clove\r\nLemon juice\r\nOlive oil\r\nSliced red bell peppers\r\nZucchine, sliced\r\nRed onion\r\nYellow squash\r\nFocaccia breac\r\nCrumbled feta cheese",
  instructions: "Mix mayo, garlic and lemon juice\r\nPreheat the grill\r\nSauce veggies\r\nAdd all the ingregiants onto the bread\r\nCook in the oven\r\n Remove from the oven and enjoy",
  category: "Sub",
  author: "Bob",
  user_id: user.id
)

California_sandwich.image.attach(io: File.open(Rails.root.join('public', 'sandwich.jpg')), filename: 'sandwich.jpg')

#Create scampi recipe
Shrimp_scampi = Recipe.create(
  name: "Shrimp Scampi",
  ingredients: "Pasta\r\nGarlic clove\r\nLemon juice\r\nOlive oil\r\nRed pepper flake\r\nShrimp\r\nWhite whine\r\nParsley\r\nBlack pepper",
  instructions: "Add butter and olive oil\r\nSaute all the veggies\r\nAdd shrimp and cook until it reach 165F\r\nBoil Pasta\r\nAdd lemon juice and parsley \r\n Serve over pasta",
  category: "Pasta",
  author: "Bob",
  user_id: user.id
)

Shrimp_scampi.image.attach(io: File.open(Rails.root.join('public', 'shrimp.jpeg')), filename: 'shrimp.jpeg')

#Create fried oreos recipe
Fried_oreo = Recipe.create(
  name: "Fried oreos",
  ingredients: "Large egg\r\nMilk\r\nVegetable oil\r\nPancake mix\r\nOreo cookies",
  instructions: "Mix oil, egg, milk and pancake\r\nDip the oreos in pancake mix\r\n Dip the orea inside air fryer\r\nPull out when golden brown",
  category: "Chocalate",
  author: "Bob",
  user_id: user.id
)

Fried_oreo.image.attach(io: File.open(Rails.root.join('public', 'friedOreo.png')), filename: 'friedOreo.png')

#Create tuna salad recipe
tuna_salad = Recipe.create(
  name: "Tuna salad",
  ingredients: "Tuna\r\nMayonaise\r\nSalt\r\nPepper\r\nLemon Juice",
  instructions: "Mix tuna, mayonaise, salt, pepper and lemon juice.",
  category: "Salad",
  author: "Bob",
  user_id: user.id
)

tuna_salad.image.attach(io: File.open(Rails.root.join('public', 'tunaSalad.jpg')), filename: 'tunaSalad.jpg')

#Create corn beef recipe
corn_beef = Recipe.create(
  name: "Corn beef hash",
  ingredients: "Butter\r\nGarlic\r\nSalt\r\nPepper\r\nPepper\r\nWorcestershire sauce\r\nParsley\r\n
  Potatoes,diced\r\nOlive oil\r\nThyme\r\nOregano\r\nBasil\r\n",
  instructions: "Coat the baking sheet\r\nToss potatoes with all dry ingrediant\r\nPut potatoes into the ovens\r\nAfter potatoes done, toss the garlic and onion\r\nAdd worcerstershire until potatoes are evenly browned\r\n
  Serve immediately,garnished with parsley",
  category: "Beef",
  author: "Bob",
  user_id: user.id
)

corn_beef.image.attach(io: File.open(Rails.root.join('public', 'cornbeef.jpeg')), filename: 'cornbeef.jpeg')

#Create mash potatoes recipe
mashed_potatoes = Recipe.create(
  name: "Mashed potatoes",
  ingredients: "Bake potatoes\r\nbutter\r\nMilk\r\nPepper\r\nSalt",
  instructions: "Boil potatoes,cook for 20 minutes, than drain\r\nMix potatoes, milk, salt, and pepper until its smooth",
  category: "Salad",
  author: "Bob",
  user_id: user.id
)

mashed_potatoes.image.attach(io: File.open(Rails.root.join('public', 'potatoes.jpg')), filename: 'potatoes.jpg')

#Create sancocho recipe
sancocho = Recipe.create(
  name: "Sancocho",
  ingredients: "Chicken\r\nDominican sausage\r\nPork sausage\r\nPepper\r\nSalt\r\nAdobe seasoning\r\nTomato sauce\r\nGreen plantaints\r\n
  Small butternut squash\r\n Large carrot\r\nWater\r\nOlive oil\r\nLime juice",
  instructions: "Season the meats with all dry ingrediants\r\nAdd tomato sauce\r\nAdd all the ingrediant and let it simmer ",
  category: "soup",
  author: "Bob",
  user_id: user.id
)

sancocho.image.attach(io: File.open(Rails.root.join('public', 'sancocho.jpeg')), filename: 'sancocho.jpeg')

#Create dominican rice recipe
dominican_rice = Recipe.create(
  name: "Dominican Rice",
  ingredients: "Vegetable oil\r\nRed onion\r\nBell pepper\r\nScallion\r\nGarlic\r\nBay leaf\r\nCumin seeds\r\nGround turmeric\r\n
  Cayenne pepper\r\n Long-grain rice\r\nChicken broth\r\nSalt\r\nCilantro\r\nParsley",
  instructions: "Saute all the veggies\r\nAdd all the dry ingrediants and stir\r\nAdd rice and chicken broth\r\nLet it cook for 30-45 minutes",
  category: "Starch",
  author: "Bob",
  user_id: user.id
)

dominican_rice.image.attach(io: File.open(Rails.root.join('public', 'dominicanRice.jpeg')), filename: 'dominicanRice.jpeg')

#Display in the console when create
puts "#{Recipe.count} recipes"
puts "#{User.count} users"
