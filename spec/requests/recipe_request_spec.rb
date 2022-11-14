require 'rails_helper'

RSpec.describe 'Recipe Request' do
  context 'Happy Path' do
    it 'retrieves 20 recipes with a given country', vcr: 'recipe_request' do
      get api_v1_recipes_path('country' => 'Thailand')

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      recipes = response_body[:data]

      expect(recipes.count).to eq(20)

      recipes.each do |recipe|
        expect(recipe.keys).to eq(%i[id type attributes])
        expect(recipe[:id]).to eq(nil)
        expect(recipe[:type]).to eq('recipe')
        expect(recipe[:attributes].keys).to eq(%i[title country image_url recipe_url])
        expect(recipe[:attributes][:title]).to be_a String
        expect(recipe[:attributes][:country]).to be_a String
        expect(recipe[:attributes][:image_url]).to be_a String
        expect(recipe[:attributes][:recipe_url]).to be_a String

        expect(recipe[:attributes]).to_not include(:label, :images, :uri, :source)
      end
    end
    
  end
  context 'Sad Path' do
    it 'returns recipes with random country if country param not present' do
      VCR.use_cassette('no_country_recipes') do
        get api_v1_recipes_path
      end

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      recipes = response_body[:data]

      VCR.use_cassette('all_country_list') do
        @country_list = CountriesService.all_countries
      end
      expect(@country_list).to include(recipes[0][:attributes][:country])
    end
    it 'returns empty array if country is an empty string', vcr: 'empty_string_recipes' do
      get api_v1_recipes_path('country' => '')
      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      recipes = response_body[:data]

      expect(recipes).to eq([])
    end
    it 'returns empty array if country param returns no country', vcr: 'no_recipes_found' do
      get api_v1_recipes_path('country' => 'chicken')

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      recipes = response_body[:data]

      expect(recipes).to eq([])
    end
    it 'returns empty array if no recipes are found for a country', vcr: 'no_recipes_found' do
      get api_v1_recipes_path('country' => 'caracao')

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      recipes = response_body[:data]

      expect(recipes).to eq([])
    end
  end
end