class Recipe
  attr_reader :title, :country, :image_url, :recipe_url

  def initialize(country, data)
    @title = data[:recipe][:label]
    @country = country
    @image_url = data[:recipe][:image]
    @recipe_url = data[:recipe][:url]
  end
end