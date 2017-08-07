class HistoriesController < ApplicationController
  def index
    histories = current_user.histories
    render json: { result: histories } if stale? histories
  end
end
