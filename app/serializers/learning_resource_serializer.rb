class LearningResourceSerializer

  def self.learning_resources(country_name, youtube, unsplash)
    {
      "data": {
        "id": nil,
        "type": 'learning_resource',
        "attributes": {
          "country": country_name,
          "video": {
            "title": youtube[0].title,
            "youtube_video_id": youtube[0].video_id
          },
          "images": images(unsplash)
        }
      }
    }
  end

  def self.images(unsplash)
    unsplash.map do |image|
      {"alt_tag": image.alt_tag, "url": image.url}
    end
  end
end