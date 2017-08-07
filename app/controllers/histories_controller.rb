class HistoriesController < ApplicationController

  api :GET, '/histories', 'List user search histories, require authentication'
  def index
    histories = current_user.histories
    render json: { result: histories } if stale? histories
  end
end
