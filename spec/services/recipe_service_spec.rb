require 'rails_helper'

RSpec.describe 'Recipe Service' do
  context 'Happy Path' do
    it 'connects and returns recipes based on a query', vcr: 'recipe_list' do
      response = RecipeService.recipes('Thailand')

      expect(response).to be_a Array
      expect(response[0][:recipe].keys).to include(:label, :image, :url)
      expect(response[0].keys).to_not include(:from, :to, :count)
    end
  end
end
