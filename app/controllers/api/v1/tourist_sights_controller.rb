class Api::V1::TouristSightsController < ApplicationController

  def index

    if params[:country] == nil || params[:country] == ''
      render json: {errors: 'No country supplied.'}, status: 404
    elsif params[:country] != nil
      tourist_sights = TouristFacade.tourist_sights(params[:country])
      render json: TouristSightSerializer.new(tourist_sights)
    end
  end
end