class HelloWorldController < ApplicationController
  skip_before_action :authenticate_request

  api :GET, '/helloworld', 'returns hello world json'
  def index
    render json: { result: 'Hello World' }
  end
end
