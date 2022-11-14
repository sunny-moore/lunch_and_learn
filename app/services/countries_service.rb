class CountriesService

  def self.all_countries
    response = conn.get('all')
    data = parsed_json(response)
  end

  def self.one_country(country)
    response = conn.get("name/#{country}")
    if response.status == 404
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