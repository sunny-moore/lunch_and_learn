class RecipeFacade

  def self.recipes(country)
    response = RecipeService.recipes(country)

    if response.status == 404
      []
    else
      response[:hits].map do |recipe|
      Recipe.new(country, recipe)
    end
  end

end