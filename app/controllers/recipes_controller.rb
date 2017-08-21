class RecipesController < ApplicationController

def index
  @recipes = Recipe.all

  respond_to do |format|
   format.html { render :index }
   format.json { render json: @recipes }
 end
end

def new
  @recipe = Recipe.new
end

def create
  @recipe = Recipe.create!(recipe_params)

  redirect_to "/recipes/#{@recipe.id}"
end

def show
  @recipe = Recipe.find(params[:id])

  respond_to do |format|
   format.html { render :show }
   format.json { render json: @recipe }
 end
end

def edit
  @recipe = Recipe.find(params[:id])
end

def update
  @recipe = Recipe.find(params[:id])
  @recipe.update(recipe_params)

  redirect_to "/recipes/#{@recipe.id}"
end

def destroy
  @recipe = Recipe.find(params[:id])
  @recipe.destroy

  redirect_to "/recipes"
end

end
