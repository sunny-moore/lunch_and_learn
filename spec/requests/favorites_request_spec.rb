require 'rails_helper'

RSpec.describe 'Favorites Requests' do
  context 'Happy Path' do
    it 'can create a user favorite', :vcr do
      user = User.create!(name: 'Bob Schneider', email: 'bob@bobschneider.com')
      params = ({
                  "api_key": user.api_key,
                  "country": "thailand",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                        })
      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_favorites_path, headers: headers, params: params, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(201)

      result = JSON.parse(response.body, symbolize_names: true)

      favorite = Favorite.last
      expect(result).to be_a Hash
      expect(favorite.country).to eq("thailand")
      expect(favorite.recipe_link).to eq("https://www.tastingtable.com/.....")
      expect(favorite.recipe_title).to eq("Crab Fried Rice (Khaao Pad Bpu)")
      expect(favorite.user_id).to eq(user.id)
    end

    it 'can retrieve a user favorites' do
      user = User.create!(name: 'Bob Schneider', email: 'bob@bobschneider.com')
      params = ({
                  "api_key": user.api_key,
                  "country": "thailand",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "recipe_title": "Some other yummy food"
                        })
      headers = {"CONTENT_TYPE" => "application/json"}
      post api_v1_favorites_path, headers: headers, params: JSON.generate(params)
      
      get api_v1_favorites_path('api_key' => user.api_key)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      results = JSON.parse(response.body, symbolize_names: true)
      favorites = results[:data]
      
      expect(favorites).to be_a Array
      expect(favorites[0][:id].to_i).to be_an Integer
      expect(favorites[0][:type]).to eq("favorite")
      expect(favorites[0][:attributes]).to be_a Hash
      expect(favorites[0][:attributes][:recipe_title]).to be_a String
      expect(favorites[0][:attributes][:recipe_link]).to be_a String
      expect(favorites[0][:attributes][:country]).to eq("thailand")
    end
  end
  context 'Sad Path', :vcr do
    it 'returns a 400 error if api_key isnt found', :vcr do
      params = ({
                  "api_key": "!h@t3th1spr0ject",
                  "country": "thailand",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/favorites", headers: headers, params: params, as: :json
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to include("Api_key not found, or missing other info")
    end

    it 'returns an error if a param is missing', :vcr do
      favorite_params = ({
                  "country": "thailand",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite_params)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to include("Api_key not found, or missing other info")
    end
  end
end
