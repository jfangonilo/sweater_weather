class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render status: 201, json: UsersSerializer.new(user)
    else
      render status: 400, json: {data: "Bad Credentials"}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end