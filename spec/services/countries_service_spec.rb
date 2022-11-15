require 'rails_helper'

RSpec.describe 'Countries Service' do
  context 'happy path' do
    it 'connects and returns an array of countries', vcr: 'country_list' do
      @countries = CountriesService.all_countries

      expect(@countries).to be_a Array
      expect(@countries.length).to eq(250)
      expect(@countries[0]).to be_a Hash
      expect(@countries[0].keys).to include(:name, :cca2, :capital, :capitalInfo)
      expect(@countries[0][:name].keys).to include(:common)
  
    end
    
    it 'connects and returns a specified country', vcr: 'one_country' do
      @country = CountriesService.one_country('Thailand')

      expect(@country).to be_a Array
      expect(@country[0][:name][:common]).to eq('Thailand')
      
    end
  end
  context 'sad path' do
    it 'returns one country with a partial match', vcr: 'country_partial' do
      country = CountriesService.one_country('United')

      expect(country).to be_a Array
      expect(country[0][:name][:common]).to eq('Mexico')
    end
    it 'returns an empty array if no country is found', vcr: 'no_match_country' do
      country = CountriesService.one_country('chicken')

      expect(country).to be_a Array
      expect(country).to eq([])
    end
  end
end