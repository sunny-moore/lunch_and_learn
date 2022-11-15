class Api::V1::RecipesController < ApplicationController

  def index
    # no country sent
    recipes = if params[:country].nil?
                RecipeFacade.random_recipes
              # Recipe Facade handles validation of country param
              else 
                RecipeFacade.recipes(params[:country])
              end
    render json: RecipeSerializer.new(recipes)
  end
end