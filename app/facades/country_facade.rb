class CountryFacade

  def self.country(country)
    response = CountriesService.one_country(country)
    country = Country.new(response)
    country.name
  end

  def self.random_country
    response = CountriesService.all_countries
    list = response.map do |country|
      country[:name][:common]
    end

    list.shuffle.first
  end
end