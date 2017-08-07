class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  api :POST, '/login', 'User authentication endpoint'
  param :email, String, required: true
  param :password, String, required: true
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
