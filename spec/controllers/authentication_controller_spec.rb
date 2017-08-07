require 'rails_helper'

describe AuthenticationController do
  describe "POST #login" do
    it "creates and returns user jwt" do
      user = create(:user)

      post :authenticate, params: { email: user.email, password: '123' }
      expect(response.status).to eq 200
      expect(response_json[:auth_token]).not_to be_nil
    end
  end
end
