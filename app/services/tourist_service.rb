class TouristService
  def self.tourist_sights(country)
    response = conn.get('/v2/places') do |req|
      req.params['categories'] = 'tourism.sights'
      req.params['filter'] = "circle:#{country.cap_lng},#{country.cap_lat},20000"
    end
    parsed_json(response)
  end

  def self.parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.geoapify.com', params: { apiKey: ENV['geoapify_api_key'] })
  end
end
