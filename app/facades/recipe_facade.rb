class RecipeFacade

  def self.recipes(country_name)
    country = CountryFacade.country(country_name)
    response =  if country.present?
                  RecipeService.recipes(country.name)
                else
                  RecipeService.recipes('')
                end

    if response == []
      []
    else
      response.map do |recipe|
        Recipe.new(country_name, recipe)
      end
    end
  end

  def self.random_recipes
    random_country = CountryFacade.random_country
    response = RecipeService.recipes(random_country[0].name.parameterize(preserve_case: true, separator: ' '))

    until response != []
      random_country = CountryFacade.random_country
      response = RecipeService.recipes(random_country[0].name.parameterize(preserve_case: true, separator: ' '))
    end
    response.map do |recipe|
      Recipe.new(random_country[0].name, recipe)
    end
  end
end