class RecipeService
  
  def self.recipes(country)
    response = conn.get("/api/recipes/v2?type=public&q=#{country}")
    parsed_json(response)
  end

  def self.parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.edamam.com', params: { app_id: ENV['edamam_app_id'], app_key: ENV['edamam_app_key'] } ) 
  end
end
