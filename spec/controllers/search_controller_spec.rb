require 'rails_helper'

describe SearchController do
  describe "GET #search" do
    include_context 'authenticated_user'

    it "searchs and returns result" do
      stub_request(:post, "https://api.twitter.com/oauth2/token")
      stub_request(:get, "https://api.twitter.com/1.1/search/tweets.json?count=100&q=test&result_type=recent")
        .to_return(body: fixture("twitter_search_result.json"))

      get :search, params: { keyword: 'test', size: '2' }
      expect(response.status).to eq 200
      expect(response_json[:result].size).to eq 2
    end
  end
end
