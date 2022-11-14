require 'rails_helper'

RSpec.describe 'Tourist Sight Poro' do
  context 'Happy Path' do
    it 'exists and has attributes' do
      data = {
          properties: {
            name: 'Boat Cafe',
            formatted: "Boat Café, 139A Oriental Parade, Oriental Bay, Wellington 6011, New Zealand",
            place_id: "51b72878e242d9654059b0d5ff1323a544c0f00102f901b6804c0f0000000092030a426f617420436166c3a9"
          }
      }

      sight = TouristSight.new(data)

      expect(sight.name).to eq('Boat Cafe')
      expect(sight.address).to eq(data[:features][0][:formatted])
      expect(sight.place_id).to eq(data[:features][0][:place_id])
    end
  end
end