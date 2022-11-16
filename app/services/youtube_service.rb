class YoutubeService
  def self.videos(country)
    response = conn.get('/youtube/v3/search') do |f|
      f.params['part'] = 'snippet'
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      f.params['maxResults'] = 1
      f.params['q'] = country
    end
    parsed_json(response)[:items]
  end

  def self.parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://youtube.googleapis.com', params: { key: ENV['youtube_api_key'] })
  end
end
