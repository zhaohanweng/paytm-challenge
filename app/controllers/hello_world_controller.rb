class HelloWorldController < ApplicationController
  skip_before_action :authenticate_request

  def index
    render json: { result: 'Hello World' }
  end
end
