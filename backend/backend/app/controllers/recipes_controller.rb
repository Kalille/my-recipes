class RecipesController < ApplicationController

    def index
        render json: Recipe.all, except: [:created_at,:updated_at], include: [:user]
    end

    def create
        recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], user_id: params[:user_id])
        if recipe.valid? 
            render json: recipe, status: :created
        else 
            render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
        end
    end
def show
    recipe = recipe_id_params
    render json: recipe
end

def update
        
    user = recipe_id_params
    user.update(name: params[:name], ingredients: params[:ingredients])
    if user

    render json: user
    else 
        render json: {errors: user.errors.full_messages}
    end
  end
    private
    def recipe_id_params
      @recipe = Recipe.find_by(id: params[:id])
    end
end
