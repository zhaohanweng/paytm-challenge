class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)

    user = User.create!(user_params)

    render json: user
  end

  def update
    user_params = params.require(:user).permit(:name, :password, :password_confirmation)

    if (params[:id].to_s == current_user.id.to_s)
      current_user.update!(user_params)
    end

    render json: current_user
  end
end
