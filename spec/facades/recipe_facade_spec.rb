require 'rails_helper' 

RSpec.describe 'Recipe Facade' do
  context 'Happy Path' do
    it 'can take a country and return an array of Recipe objects', vcr: 'recipe_list' do
      recipes = RecipeFacade.recipes('Thailand')

      expect(recipes).to be_a Array
      expect(recipes[0]).to be_a Recipe
      expect(recipes.length).to eq(20)
      expect(recipes[0].title).to include("Andy Ricker's Naam Cheuam")
      expect(recipes[0].image_url).to be_a String
      expect(recipes[0].image_url).to include("https://edamam-product-images.s3.amazonaws.com/web-img")
      expect(recipes[0].recipe_url).to be_a String
      expect(recipes[0].recipe_url).to include("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam")
      expect(recipes[0].country).to eq('Thailand')
      expect(recipes[1].country).to eq('Thailand')
      expect(recipes.last.country).to eq('Thailand')
    end
  end
end