class IngredientsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
      @ingredients = Ingredient.all

      respond_to do |format|
       format.html { render :index }
       format.json { render json: @ingredients }
     end
    end

    def new
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = @recipe.ingredients.new

      respond_to do |format|
        format.html { render :new }
        format.json { render json: @ingredient}
      end
    end
  end


    def create
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = @recipe.ingredients.new(ingredient_params)
      respond_to do |format|
        if @ingredient.save!
            format.html {redirect_to [@recipe, @ingredient], notice: 'Ingredient was successfully updated.'}
            format.json {render json: @ingredient}
          else
            format.html {render :edit}
            format.json {render json: @ingrediente.erros, status: :unprocessable_entity}
          end
        end
    end

    def show
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = Ingredient.find(params[:id])

      respond_to do |format|
       format.html { render :show }
       format.json { render json: @ingredient }
     end
    end

    def edit
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = Ingredient.find(params[:id])
    end

    def update
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = Ingredient.find(params[:id])
      respond_to do |format|
        if @ingredient.update!(ingredient_params)
          if @comment.update!(comment_params)
    format.html {redirect_to [@recipe, @ingredient], notice: 'Ingredient was successfully updated.'}
    format.json {render json: @ingredient}
  else
    format.html {render :edit}
    format.json {render json: @ingredient.erros, status: :unprocessable_entity}
    end
  end
end

def destroy
    @recipe = Redcipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to @recipe
  end


    private
    def ingredient_params
      params.require(:ingredient).permit(:name, :type)
    end
end
