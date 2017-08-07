require 'rails_helper'
require 'support/response_helpers'

describe UsersController do
  describe "POST #create" do
    it "creates and returns user json" do
      user_params = {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: '123',
        password_confirmation: '123'
      }

      post :create, params: { user: user_params }
      expect(response.status).to eq 200
      expect(response_json[:name]).to eq user_params[:name]
      expect(response_json[:email]).to eq user_params[:email]
      expect(response_json[:password]).to be_nil
      expect(response_json[:password_digest]).to be_nil
    end
  end

  describe "PUT #update" do
    let(:user) { build_stubbed(:user) }

    user_params = {
      name: 'updated',
      email: 'updated@gmail.com',
      password: '1234',
      password_confirmation: '1234'
    }

    it 'require user authentication' do
      patch :update, params: { id: user.id, user: user_params }
      expect(response.status).to eq 401
    end

    it "updates and returns user json" do
      created_user = create(:user)

      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(created_user)
      patch :update, params: { id: created_user.id, user: user_params }
      expect(response.status).to eq 200
      expect(response_json[:name]).to eq user_params[:name]
      expect(response_json[:email]).to eq created_user.email
    end

    it "does not updates other user json" do
      created_user = create(:user)

      allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(created_user)
      patch :update, params: { id: user.id, user: user_params }
      expect(response.status).to eq 200
      expect(response_json[:name]).to eq created_user.name
      expect(response_json[:email]).to eq created_user.email
    end
  end
end
