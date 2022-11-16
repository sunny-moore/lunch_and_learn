class Youtube
  attr_reader :video_id, :title

  def initialize(data)
    @video_id = data[:id][:videoId]
    @title = data[:snippet][:title]
  end
end
