class Api::V1::RecipesController < ApplicationController

  def index
    countries = CountriesService.all_countries

    # no country sent
    if params[:country] == nil
      random_country = countries.sample
      recipes = RecipeFacade.recipes(random_country.parameterize(preserve_case: true))
      until recipes[0] != nil
        recipes = RecipeFacade.recipes(random_country.parameterize(preserve_case: true))
      end
      render json: RecipeSerializer.new(recipes)
    # country param is an empty string
    elsif params[:country] == ''
      render json: RecipeSerializer.new([])
    else
      country = CountriesService.one_country(params[:country])
      # no valid countries were returned
      if country == []
        render json: RecipeSerializer.new([])
      # valid country was returned
      else
        recipes = RecipeFacade.recipes(country.sample)
        render json: RecipeSerializer.new(recipes)
      end
    end
  end
end