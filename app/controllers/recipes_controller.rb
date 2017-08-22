class RecipesController < ApplicationController

def index

  if params[:search]
    @recipes = []
    @ingredients = Ingredient.search(params[:search])
    @ingredients.each do |ingredient|
      @recipes.push(Recipe.find_by(name: ingredient.recipe.name))
    end
  else
    @ingredients = Ingredient.all
    @recipes = Recipe.all
  end
  # render json: @recipes
  @recipes = @recipes.uniq.sort_by{|recipe| recipe["name"]}
  respond_to do |format|
   format.html { render :index }
   format.json { render json: @recipes, include: [:ingredients]}
  end
end

def new
  @recipe = Recipe.new
end

def create
  @recipe = Recipe.new(recipe_params)

  respond_to do |format|
    if @recipe.save!
      format.html { redirect_to @recipe, notice: 'Recipe was successfully created.'}
      format.json { render json: @recipe, status: :created, location: @recipe}
    else
      format.html { render :new }
      format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @recipe = Recipe.find(params[:id])

  respond_to do |format|
   format.html { render :show }
   format.json { render json: @recipe, include: [:ingredients] }
 end
end

def edit
  @recipe = Recipe.find(params[:id])
end

def update
  @recipe = Recipe.find(params[:id])
  @recipe.update(recipe_params)

  redirect_to recipes_path
end

def destroy
  @recipe = Recipe.find(params[:id])
  @recipe.destroy

  redirect_to "/recipes"
end

private
def recipe_params
  params.require(:recipe).permit(:name, :directions, :photo_url, :search)
end

end
