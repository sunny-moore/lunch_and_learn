class CountryFacade

  def self.country(country)
    response = CountriesService.one_country(country)
    if response == []
      []
    else
      Country.new(response[0])
    end
  end

  def self.random_country
    response = CountriesService.all_countries

    list = response.map do |country|
      Country.new(country)

    end
    list.sample(1)
  end
end