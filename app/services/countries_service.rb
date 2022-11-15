class CountriesService

  def self.all_countries
    response = conn.get('all')
    parsed_json(response)
  end

  # allows for a partial match, returning one selection
  # returns an empty array if no country matches
  def self.one_country(country)
    response = conn.get("name/#{country}")
    if response.status != 200
      []
    else
      data = parsed_json(response)
      data.take(1)
    end
  end

  def self.parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://restcountries.com/v3.1/')
  end

end