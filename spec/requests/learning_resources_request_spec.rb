require 'rails_helper'

RSpec.describe 'Learning Resources Request' do
  context 'Happy Path' do
    it 'takes a youtube and unsplash object and returns a response', vcr: 'success_learning_resources' do
      get api_v1_learning_resources_path('country' => 'Thailand')

      expect(response).to be_successful
      response_body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response_body.count).to eq(1)

      resource = response_body[:data]

      expect(resource.keys).to eq(%i[id type attributes])
      expect(resource[:id]).to eq(nil)
      expect(resource[:type]).to eq('learning_resource')
      expect(resource[:attributes].keys).to eq(%i[country video images])
      expect(resource[:attributes][:country]).to be_a String
      expect(resource[:attributes][:video]).to be_a Hash
      expect(resource[:attributes][:images]).to be_a Array
    end
  end
end