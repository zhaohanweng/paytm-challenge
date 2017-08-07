class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  api :POST, '/users', 'Creates a new user'
  param :name, String, required: true
  param :email, String, required: true
  param :password, String, required: true
  param :password_confirmation, String, required: true
  def create
    user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)

    user = User.create!(user_params)

    render json: user
  end

  api :PATCH, '/users/:id', 'Update user name or password, require authentication'
  param :name, String
  param :password, String
  param :password_confirmation, String
  def update
    user_params = params.require(:user).permit(:name, :password, :password_confirmation)

    if (params[:id].to_s == current_user.id.to_s)
      current_user.update!(user_params)
    end

    render json: current_user
  end
end
