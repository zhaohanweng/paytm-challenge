require 'rails_helper'

describe HistoriesController do
  describe "GET #index" do
    include_context "authenticated_user"

    it "returns user search histories" do
      create(:history, user: authenticated_user)
      create(:history, user: authenticated_user)

      get :index
      expect(response.status).to eq 200
      expect(response_json[:result].size).to eq 2
    end
  end
end
