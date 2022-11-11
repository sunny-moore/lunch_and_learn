class CountriesService

  def self.all_countries
    response = conn.get('all')
    parsed_json(response)
  end
  
  def self.one_country(country)
    response = conn.get("name/#{country}")
    parsed_json(response)
  end
  def self.parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://restcountries.com/v3.1/')
  end

end