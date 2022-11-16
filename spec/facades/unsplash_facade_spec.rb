require 'rails_helper'

RSpec.describe 'Unsplash Facade' do
  context 'Happy Path' do
    it 'calls the service and creates a Unsplash object', vcr: 'success_unsplash_facade' do
      unsplash = UnsplashFacade.photos('Thailand')

      expect(unsplash).to be_a Array
      expect(unsplash[0]).to be_a Unsplash
      expect(unsplash.length).to eq(10)
    end
  end
end