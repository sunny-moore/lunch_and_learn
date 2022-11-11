require 'rails_helper'

RSpec.describe 'Country Poro' do
  it 'can have an array of country names' do
    data = [
      {
        name: {
          common: 'Thailand'
        }
      },
      {
        name: {
          common: 'United States'
        }
      }
    ]

    country = Country.new(data)
    expect(country).to be_a Country
    expect(country.country_list).to be_a Array
    expect(country.country_list.length).to eq(2)
    expect(country.country_list[0]).to eq('Thailand')
  end
end