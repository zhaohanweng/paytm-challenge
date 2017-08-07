require 'rails_helper'

describe AuthorizeApiRequest do
  it "returns user" do
    user = create(:user)

    token = AuthenticateUser.call(user.email,  '123').result
    result = AuthorizeApiRequest.call('Authorization' => token).result
    expect(result.email).to eq user.email
  end

  it "does not return user" do
    result = AuthorizeApiRequest.call().result
    expect(result).to be_nil
  end
end
