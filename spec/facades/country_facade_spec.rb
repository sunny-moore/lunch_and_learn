require 'rails_helper'

RSpec.describe 'Country Facade' do
  context 'Happy Path' do
    it 'gets a list of countries with a given name and returns one', vcr: 'one_country_facade' do
      countries = CountryFacade.country('United')

      expect(countries).to be_a String
      expect(countries).to eq('Mexico')
    end

    it 'can return a random country from a country list', vcr: 'random_country_facade' do
      country = CountryFacade.random_country
      VCR.use_cassette('random_country_facade2') do
      @country2 = CountryFacade.random_country
      end
      expect(country).to_not eq(@country2)
    end
  end
end