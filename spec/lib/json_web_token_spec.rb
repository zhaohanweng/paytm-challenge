require 'rails_helper'

describe JsonWebToken do
  it "encodes and decodes data" do
    user = build_stubbed(:user)

    jwt = JsonWebToken.encode(user_email: user.email)
    result = JsonWebToken.decode(jwt)

    expect(result[:user_email]).to eq user.email
  end
end
