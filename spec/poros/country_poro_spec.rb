require 'rails_helper'

RSpec.describe 'Country Poro' do
  it 'exists and has attributes' do
    data = [
      {
        name: {
          common: 'Thailand'
        },
        capital: [
          'Bangkok'
        ],
        capitalInfo: {
          latlng: [
            13.75,
            100.52
          ]
        }
      }
    ]

    country = Country.new(data)
    expect(country).to be_a Country
    expect(country.name).to eq('Thailand')
    expect(country.capital).to eq('Bangkok')
    expect(country.cap_lat).to eq(13.75)
    expect(country.cap_lng).to eq(100.52)
  end
end