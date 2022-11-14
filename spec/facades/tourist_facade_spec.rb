require 'rails_helper'

RSpec.describe 'Tourist Facade' do
  context 'Happy Path' do
    it 'returns an array of tourist_sight objectsin a capital city, when given a country', vcr: 'tourist_facade' do
      tourist_sights = TouristFacade.tourist_sights('Britain')

      expect(tourist_sights).to be_a Array
      expect(tourist_sights.length).to eq(20)
      expect(tourist_sights[0].name).to eq("Brockwell Lido")
      expect(tourist_sights[0].address).to eq("Brockwell Lido, Dulwich Road, London SE24 0PA, United Kingdom")
      expect(tourist_sights[0].place_id).to eq("51153512c52d40bbbf597e108999fdb94940f00102f9018350eb120000000092030e42726f636b77656c6c204c69646f")

    end
  end
end