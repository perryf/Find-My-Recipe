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
  'chicken', 'duck', 'eggs', 'steak', 'ground beef', 'bacon', 'chorizo', 'saugage', 'pork', 'clam', 'oyster', 'salmon', 'tuna', 'bean', 'tofu', 'lamb', 'ribs', 'goat', 'seafood', 'turkey', 'peanut', 'walnut', 'almond', 'cashew', 'peacan', 'pistachio', 'pinenut', 'chestnut', 'lettuce', 'beet', 'carrot', 'celery', 'spinach', 'broccoli', 'radish', 'tomato', 'garlic', 'onion', 'kale', 'asparagus', 'cauliflower', 'cabbage', 'peas', 'eggplant', 'turnip', 'brussels sprout', 'artichoke', 'green bean', 'okra', 'leak', 'zucchini', 'chard', 'chili pepper', 'arugula', 'scallion', 'shallot', 'corn', 'jalapeno', 'milk', 'butter', 'cottage cheese', 'mozzarella', 'parmesan', 'sour cream', 'yogurt', 'butter', 'chedder', 'pepper jack', 'swiss', 'buttermilk', 'gouda', 'condensed milk', 'coconut milk', 'cream', 'cream cheese', 'feta', 'greek yogurt', 'goat milk', 'apple', 'orange', 'banana', 'blueberry', 'coconut', 'grape', 'stawberry', 'raspberry', 'watermellon', 'lemon', 'lime', 'peach', 'cherry', 'mango', 'pineapple', 'avacado', 'fig', 'apricot', 'grapefruit', 'papaya', 'kiwi', 'blackberry', 'berry', 'cranberry', 'olive', 'cherimoya', 'guava', 'bread', 'breadcrumbs', 'rice', 'quinoa', 'noodles', 'couscous', 'wheat', 'wheat flour', 'tortilla', 'flour', 'cereal', 'brown rice', 'rice noodles', 'barley', 'buckwheat', 'wild rice', 'grits', 'oregeno', 'sage', 'saffire', 'cumin', 'paprika', 'parsley', 'olive oil', 'vinegar', 'yeast', 'pepper', 'salt', 'mustard', 'ketchup', 'sugar', 'honey', 'ginger', 'cinnamon', 'turmeric', 'nutmeg', 'clove', 'coriander', 'fennel', 'powder', 'horseradish', 'basil', 'cilantro', 'bay leaves', 'dill weed', 'lavender', 'rosemary', 'thyme'
]

queries.each do |query|
  recipe_data = HTTParty.get("https://api.edamam.com/search?q=#{query}&#{app_id}&app_key=#{app_key}")
  recipe_data["hits"].each do |recipe|
    new_recipe = Recipe.create!(
      name: recipe["recipe"]["label"],
      directions: recipe["recipe"]["url"],
      source: recipe["recipe"]["source"],
      photo_url: recipe["recipe"]["image"],
      health_labels: recipe["recipe"]["healthLabels"] * "" + recipe["recipe"]["dietLabels"] * ""
      )
      recipe["recipe"]["ingredients"].each do |ingredient|
      new_ingredient = Ingredient.create!(
        name: ingredient["text"],
        recipe: new_recipe
      )
    end
  end
end
