require 'rails_helper'

RSpec.describe 'Countries Service' do
  context 'happy path' do
    it 'connects and returns an array of countries response', vcr: 'country_list' do
      VCR.use_cassette('country_list') do
      @countries = CountriesService.all_countries
      end
      expect(@countries).to be_a Array
      expect(@countries[0]).to include(:name, :capital, :region)
      expect(@countries[0][:name]).to have_key(:common)
    end
    
    it 'connects and returns a specified country', vcr: 'one_country' do
      VCR.use_cassette('one_country') do
      @country = CountriesService.one_country('Thailand')
      end
      expect(@country).to be_a Array
      expect(@country[0]).to include(:name, :capital, :region)
      expect(@country[0][:name]).to have_key(:common)
    end
  end
end