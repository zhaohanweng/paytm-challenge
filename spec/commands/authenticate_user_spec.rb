require 'rails_helper'

describe AuthenticateUser do
  it "creates and returns user jwt" do
    user = create(:user)

    result = AuthenticateUser.call(user.email,  '123').result
    expect(result).not_to be_nil
  end

  it "does not create user jwt" do
    user = create(:user)

    result = AuthenticateUser.call(user.email,  'not123').result
    expect(result).to be_nil
  end
end
