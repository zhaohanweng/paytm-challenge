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
end
