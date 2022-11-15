require 'rails_helper'

RSpec.describe 'Youtube Facade' do
  context 'Happy Path' do
    it 'calls the service and creates a Youtube object', vcr: 'success_youtube_facade' do
      youtube = YoutubeFacade.videos('Thailand')

      expect(youtube).to be_a Array
      expect(youtube[0]).to be_a Youtube
    end
  end
end