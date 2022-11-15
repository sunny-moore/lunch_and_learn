require 'rails_helper'

RSpec.describe 'Youtube Service' do
  context 'Happy Path' do
    it 'connects and returns a response', vcr: 'success_youtube_service' do
      response = YoutubeService.videos('Thailand')

      expect(response).to be_a Array
      expect(response.length).to eq(1)
      expect(response[0].keys).to include(:kind, :etag, :id, :snippet)
      expect(response[0][:id].keys).to include(:kind, :videoId)
      expect(response[0][:snippet].keys).to include(:title, :description)

    end
  end
end