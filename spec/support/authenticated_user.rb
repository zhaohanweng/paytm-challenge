shared_context "authenticated_user" do
  let(:authenticated_user) { create(:user) }

  before(:each) do
    allow(AuthorizeApiRequest).to receive_message_chain(:call, :result).and_return(authenticated_user)
  end
end
