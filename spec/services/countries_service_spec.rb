require 'rails_helper'

RSpec.describe 'Countries Service' do
  context 'happy path' do
    it 'connects and returns an array of country names', vcr: 'country_list' do
      @countries = CountriesService.all_countries

      expect(@countries).to be_a Array
      expect(@countries.length).to eq(250)
      expect(@countries[0]).to be_a String
  
    end
    
    it 'connects and returns a specified country', vcr: 'one_country' do
      @country = CountriesService.one_country('Thailand')

      expect(@country).to be_a Array
      expect(@country[0]).to eq('Thailand')
      
    end
  end
  context 'sad path' do
    it 'returns one country with a partial match', vcr: 'country_partial' do
      country = CountriesService.one_country('United')

      expect(country).to be_a Array
      expect(country[0]).to eq('Mexico')
    end
  end
end