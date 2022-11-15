require 'rails_helper'

RSpec.describe 'Country Facade' do
  context 'Happy Path' do
    it 'gets a list of countries with a given name and returns one', vcr: 'one_country_facade' do
      country = CountryFacade.country('United')

 
      expect(country).to be_a Country
      expect(country.name).to eq('Mexico')
      expect(country.capital).to eq('Mexico City')
      expect(country.cap_lat).to eq(19.43)
      expect(country.cap_lng).to eq(-99.13)
    end

    it 'can return a random country from a country list', vcr: 'random_country_facade' do
      # allow(CountryFacade).to receive(:random_country).and_return('Russia')
      country = CountryFacade.random_country
      VCR.use_cassette('random_country_facade2') do
      @country2 = CountryFacade.random_country
      end
      expect(country).to_not eq(@country2)
    end
  end
end