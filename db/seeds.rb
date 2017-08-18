# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
Ingredient.destroy_all

# recipe1= Recipe.create(name:"Pokr Adobo", directions:"", photo_url:"")
# recipe2 = Recipe.create(name:"Buffalo Wings", directions:"", photo_url:"")
#
#
# ingredient1= Ingredient.create(name:"pork", type:"", recipe: recipe1)
# ingredient2 = Ingredient.create(name:"chicken wings", type:"", recipe: recipe2)


app_id = '15986f01'
app_key = 'cf226836999d88e4e6e9f3c420c490ec'

recipes = []
ingredients = []

queries = [
  'chicken', 'eggs', 'steak', 'salmon', 'tuna', 'bean', 'tofu', 'lettuce', 'beet', 'carrot', 'celery', 'spinach', 'broccoli', 'radish', 'tomato', 'garlic', 'onion', 'milk', 'butter', 'cottage cheese', 'mozzarella', 'parmesan', 'sour cream', 'yogurt', 'butter', 'apple', 'orange', 'banana', 'blueberry', 'bread', 'breadcrumbs', 'rice', 'quinoa', 'noodles', 'couscous', 'oregeno', 'sage', 'saffire', 'cumin', 'paprika', 'parsley', 'olive oil', 'vinegar'
]

 lettuce["hits"][1]["recipe"]["label"]

queries.each do |query|
  recipe_data = HTTParty.get("https://api.edamam.com/search?q=query&#{app_id}&app_key=#{app_key}")
  recipe_data["hits"].each do |recipe|
    new_recipe = Recipe.create!(
      name: recipe["recipe"]["label"]
      directions: recipe["recipe"]["url"]
      photo_url: recipe["recipe"]["image"]
      )
    new_ingredient = Ingredient.create!(
      name: recipe["recipe"]["ingredients"]["text"]
      type: recipe["recipe"]["ingredients"]["weight"]
      recipe: new_recipe
    )
  end
end
