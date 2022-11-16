class UnsplashFacade
  def self.photos(country_name)
    response = UnsplashService.photos(country_name)
    response.map do |photo|
      Unsplash.new(photo)
    end
  end
end
