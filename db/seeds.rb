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

queries = [
  'chicken', 'duck', 'eggs', 'steak', 'ground beef', 'bacon', 'sausage', 'pork', 'salmon', 'tuna', 'bean', 'tofu', 'lamb', 'ribs', 'goat', 'seafood', 'turkey', 'peanut', 'almond', 'cashew', 'spinach', 'broccoli', 'tomato', 'garlic', 'onion', 'kale', 'cabbage', 'peas', 'eggplant', 'turnip', 'brussels sprout', 'zucchini', 'arugula', 'corn', 'jalapeno', 'milk', 'butter', 'mozzarella', 'parmesan', 'sour cream', 'yogurt', 'butter', 'cheddar', 'coconut milk', 'feta', 'apple', 'orange', 'banana', 'coconut', 'lemon', 'lime', 'avocado', 'fig', 'cranberry', 'olive', 'bread', 'breadcrumbs', 'rice', 'quinoa', 'noodles', 'couscous', 'wheat', 'tortilla', 'spaghetti', 'shells', 'crab', 'gnocchi', ’pasta', ‘mint', 'beef chunk', 'chicken breast', ‘ham’
]

queries.each do |query|
  recipe_data = HTTParty.get("https://api.edamam.com/search?q=#{query}&#{app_id}&app_key=#{app_key}")
  recipe_data["hits"].each do |recipe|
    new_recipe = Recipe.create!(
      name: recipe["recipe"]["label"],
      directions: recipe["recipe"]["url"],
      source: recipe["recipe"]["source"],
      photo_url: recipe["recipe"]["image"],
      health_labels: recipe["recipe"]["healthLabels"] * ", " + recipe["recipe"]["dietLabels"] * ", "
      )
      recipe["recipe"]["ingredients"].each do |ingredient|
      new_ingredient = Ingredient.create!(
        name: ingredient["text"],
        recipe: new_recipe
      )
    end
  end
end
