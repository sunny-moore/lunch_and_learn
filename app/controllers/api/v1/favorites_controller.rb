class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      favorites = user.favorites
      render json: FavoriteSerializer.new(favorites), status: 200
    else
      render json: { errors: 'Api key unknown' }, status: 400
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      favorite = Favorite.new(favorite_params)
      favorite.user_id = user.id
      favorite.save
      render json: { success: 'Favorite added successfully.' }, status: 201
    else
      render json: { errors: 'Api_key not found, or missing other info' }, status: 400
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end
