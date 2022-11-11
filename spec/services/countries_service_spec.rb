require 'rails_helper'

RSpec.describe 'Countries Service' do
  context 'happy path', vcr: 'country_list' do
    it 'connects and returns a response' do
      countries = CountriesService.countries

      expect(countries).to be_a Array
      expect(countries[0]).to include(:name, :capital, :region)
      expect(countries[0][:name]).to have_key(:common)
    end
  end
end