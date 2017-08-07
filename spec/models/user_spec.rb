require 'rails_helper'

describe User do
  subject { build_stubbed(:user) }

  describe 'validations' do
    it 'has a name' do
      expect(build_stubbed(:user, name: nil)).not_to be_valid
      expect(build_stubbed(:user, name: 'name')).to be_valid
    end

    it 'has a email' do
      expect(build_stubbed(:user, email: nil)).not_to be_valid
    end

    it 'validates email format' do
      expect(build_stubbed(:user, email: 'email')).not_to be_valid
      expect(build_stubbed(:user, email: 'email@g.com')).to be_valid
    end

    it 'validates unique email' do
      expect(create(:user, email: 'email@g.com')).to be_valid
      expect{ create(:user, email: 'email@G.com') }.to raise_error(ActiveRecord::RecordInvalid)
    end


    it 'has a password' do
      expect(build_stubbed(:user, password: nil)).not_to be_valid
      expect(build_stubbed(:user, password: '123')).to be_valid
    end

    it 'has a matching password_confirmation' do
      expect(build_stubbed(:user, password: '2', password_confirmation: '1')).not_to be_valid
      expect(build_stubbed(:user, password: '1', password_confirmation: '1')).to be_valid
    end
  end

  # describe 'collection_state' do
  #   let(:app_feed) { build_stubbed(:hashtag_app_feed, app_feed_query: ['Test1']) }
  #   let(:feed) { build_stubbed(:hashtag_feed, collection_meta: { collection_state: "#{Feed::BITWISE_STATE[:normal]}" }) }
  #   let(:feed1) { build_stubbed(:hashtag_feed, collection_meta: { collection_state: "#{Feed::BITWISE_STATE[:rate_limited]}" }) }
  #   let(:feed2) { build_stubbed(:hashtag_feed, collection_meta: { collection_state: "#{Feed::BITWISE_STATE[:normal]}" }) }
  #   it 'returns the error state' do
  #     allow(app_feed).to receive(:feeds).and_return([feed, feed1, feed2])
  #     expect(app_feed.collection_state).to eq :rate_limited
  #   end

  #   it 'returns normal state' do
  #     allow(app_feed).to receive(:feeds).and_return([feed, feed2])
  #     expect(app_feed.collection_state).to eq :normal
  #   end
  # end
end
