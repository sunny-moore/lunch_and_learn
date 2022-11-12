require 'rails_helper'

RSpec.describe 'Country Poro' do
  it 'exists and has name' do
    data = [
      {
        name: {
          common: 'Thailand'
        }
      }
    ]

    country = Country.new(data)
    expect(country).to be_a Country
    expect(country.name).to eq('Thailand')
  end
end