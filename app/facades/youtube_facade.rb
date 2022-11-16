class YoutubeFacade
  def self.videos(country_name)
    response = YoutubeService.videos(country_name)
    response.map do |video|
      Youtube.new(video)
    end
  end
end
