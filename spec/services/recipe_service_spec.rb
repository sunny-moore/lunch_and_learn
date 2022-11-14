require 'rails_helper'

RSpec.describe 'Recipe Service' do
  context 'Happy Path' do
    it 'connects and returns recipes based on a query', vcr: 'recipe_list' do
      response = RecipeService.recipes('Thailand')

      expect(response).to be_a Hash
      expect(response[:hits]).to be_a Array
      expect(response[:hits][0][:recipe]).to include(:label, :image, :url)
    end
  end
end
