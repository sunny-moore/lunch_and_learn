class TouristFacade

  def self.tourist_sights(country_name)
    country = CountryFacade.country(country_name)
    response = TouristService.tourist_sights(country)

    response[:features].map do |sight|
      TouristSight.new(sight)
    end
  end

  def self.random_sights
    country = CountryFacade.random_country
    binding.pry
    response = TouristService.tourist_sights(country)
  end
end