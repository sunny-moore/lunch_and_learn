require 'rails_helper'

RSpec.describe 'Unsplash Service' do
  context 'Happy Path' do
    it 'connects and returns an array', vcr: 'success_unsplash_service' do
      results = UnsplashService.photos('Thailand')

      expect(results).to be_a Array
      expect(results.length).to eq(10)
      expect(results[0].keys).to include(:alt_description, :urls)
      expect(results[0][:urls].keys).to include(:raw, :full, :regular)
    end
  end
end