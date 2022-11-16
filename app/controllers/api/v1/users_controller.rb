class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: 201
    elsif User.find_by(email: params[:email])
      render json: { error: 'This email already exists' }, status: 400
    else
      render json: { error: 'An unknown error occured' }, status: 418
    end
  end

  private

  def user_params
    params.permit(:name, :email, :api_key)
  end
end
