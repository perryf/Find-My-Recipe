# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
Ingredient.destroy_all

recipe1= Recipe.create(name:"Pokr Adobo", directions:"", photo_url:"")
recipe2 = Recipe.create(name:"Buffalo Wings", directions:"", photo_url:"")


ingredient1= Ingredient.create(name:"pork", type:"", recipe: recipe1)
ingredient2 = Ingredient.create(name:"chicken wings", type:"", recipe: recipe2)
