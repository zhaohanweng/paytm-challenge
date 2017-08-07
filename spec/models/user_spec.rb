require 'rails_helper'

describe User do
  let(:user) { build_stubbed(:user) }

  describe 'validations' do
    it 'belongs to user' do
      expect(build_stubbed(:history)).not_to be_valid
      expect(build_stubbed(:history, user: user)).to be_valid
    end

    it 'has a keyword' do
      expect(build_stubbed(:history, keyword: nil, user: user)).not_to be_valid
      expect(build_stubbed(:history, keyword: 'test', user: user)).to be_valid
    end
  end

  describe "self.update_history" do
    let(:created_user) { create(:user) }

    it 'update modified time' do
      history = create(:history, user: created_user, keyword: 'test')
      History.update_history(created_user, 'test')
      modified_history = History.find(history.id)
      expect(modified_history.updated_at > history.updated_at).to be true
    end
  end
end
