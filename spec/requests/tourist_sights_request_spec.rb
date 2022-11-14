require 'rails_helper'

RSpec.describe 'Tourist Sights Request' do
  context 'Happy Path' do
    it 'returns a list of tourist sights ', vcr: 'tourist_request' do
      get api_v1_tourist_sights_path('country' => 'Britain')

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      sights = response_body[:data]

      expect(sights.count).to eq(20)

      sights.each do |sight|
        expect(sight.keys).to eq(%i[id type attributes])
        expect(sight[:id]).to eq(nil)
        expect(sight[:type]).to eq('tourist_sight')
        expect(sight[:attributes].keys).to eq(%i[name address place_id])
        expect(sight[:attributes][:name]).to be_a String
        expect(sight[:attributes][:address]).to be_a String
        expect(sight[:attributes][:place_id]).to be_a String
      end
    end
    xit 'if no country is supplied it returns sights from a random country capital', :vcr do
      get api_v1_tourist_sights_path

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      sights = response_body[:data]

      expect(sights.count).to eq(20)

      sights.each do |sight|
        expect(sight.keys).to eq(%i[id type attributes])
        expect(sight[:id]).to eq(nil)
        expect(sight[:type]).to eq('tourist_sight')
        expect(sight[:attributes].keys).to eq(%i[name address place_id])
        expect(sight[:attributes][:name]).to be_a String
        expect(sight[:attributes][:address]).to be_a String
        expect(sight[:attributes][:place_id]).to be_a String
      end
    end
  end
  context 'Sad Path' do
    it 'returns an error if no country is supplied', :vcr do
      get api_v1_tourist_sights_path('country' => '')

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:errors]).to eq('No country supplied.')
    end

    it 'returns an error if country parameter is missing', :vcr do
      get api_v1_tourist_sights_path

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      response_body = JSON.parse(response.body, symbolize_names: true)
      expect(response_body[:errors]).to eq('No country supplied.')
    end
  end
end