require 'rails_helper'

RSpec.describe 'Tourist Service' do
  context 'Happy Path' do
    before :each do
      VCR.use_cassette('one_country') do
        @country = CountryFacade.country('Latvia')
      end
      
    end
    it 'connects and returns data', vcr: 'tourist_service' do
      response = TouristService.tourist_sights(@country)

      expect(response).to be_a Hash
      expect(response[:features]).to be_a Array
      expect(response[:features][0]).to include(:type, :properties)
      expect(response[:features][0][:properties]).to include(:name, :country, :formatted, :place_id)
    end
  end
end