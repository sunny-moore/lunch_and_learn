class UnsplashService

  def self.photos(country)
    response = conn.get('/search/photos') do |f|
      f.params['order_by'] = 'relevant'
      f.params['query'] = country
    end
    parsed_json(response)[:results]
  end

  def self.parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com', params: { client_id: ENV['unsplash_access_key'] })
  end
end