require 'rails_helper'

RSpec.describe 'User Requests', :vcr do
  context 'Happy Path' do
    it 'registers a new user' do
      params = ({
        name: 'Bob Schneider',
        email: 'bob@bobschneider.com'
        })
      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_users_path, headers: headers, params: params, as: :json

      body = JSON.parse(response.body, symbolize_names: true)
      user = User.last

      expect(response).to be_successful
      expect(response).to have_http_status(201)
      expect(body[:data]).to have_key(:id)
      expect(body[:data][:id].to_i).to eq(user.id)
      expect(body[:data]).to have_key(:type)
      expect(body[:data][:type]).to eq('user')
      expect(body[:data]).to have_key(:attributes)
      expect(body[:data][:attributes]).to have_key(:name)
      expect(body[:data][:attributes][:name]).to eq(user.name)
      expect(body[:data][:attributes]).to have_key(:email)
      expect(body[:data][:attributes][:email]).to eq(user.email)
      expect(body[:data][:attributes]).to_not have_key(:password)
      expect(body[:data][:attributes]).to_not have_key(:password_confirmation)
      expect(user.name).to eq(params[:name])
      expect(user.email).to eq(params[:email])
      expect(user.api_key).to be_a String
      expect(body[:data][:attributes]).to have_key(:api_key)
      expect(body[:data][:attributes][:api_key]).to be_a String
      expect(body[:data][:attributes][:api_key].length).to eq(30)
    end
  end
  context 'Sad Path' do
    it 'returns a 400 code if email already exists', :vcr do
      user = User.create!(name: 'Bob Schneider', email: 'bob@bobschneider.com')
      user_params = ({
        name: 'Bob Schneider',
        email: 'bob@bobschneider.com'
        })
      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_users_path, headers: headers, params: user_params, as: :json

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:error]).to eq('This email already exists')
    end
  end
end









