class SearchController < ApplicationController

  api :GET, '/search', 'Searches twitter api with keyword, require authentication'
  param :keyword, String
  param :size, :number, desc: 'Search result size'
  param :feeling_lucky, [true, false], desc: 'Search random keyword if set'
  def search
    params[:keyword] = lucky_keyword if (params[:feeling_lucky] == 'true')

    return unless stale?(params[:keyword].to_s + '_-_-_' + params[:size].to_s)

    result = []

    if (params[:keyword].present?)
      History.update_history(current_user, params[:keyword])
      Rails.cache.write(cache_key(params[:keyword]), true)

      result = TwitterService.search(params[:keyword], params[:size])
    end

    render json: { keyword: params[:keyword], result: result }
  end

  private

  def lucky_keyword
    keyword = Faker::Coffee.blend_name

    while (Rails.cache.exist?(cache_key(keyword)))
      keyword = Faker::Coffee.blend_name
    end

    keyword
  end

  def cache_key(keyword)
    current_user.email + '=-=' + keyword
  end
end
