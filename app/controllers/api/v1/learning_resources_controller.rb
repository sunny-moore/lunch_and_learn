class Api::V1::LearningResourcesController < ApplicationController
  
  def index
    video = YoutubeFacade.videos(params[:country])
    photos = UnsplashFacade.photos(params[:country])

    render json: LearningResourceSerializer.learning_resources(params[:country], video, photos)
  end
end