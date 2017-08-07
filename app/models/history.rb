class History < ApplicationRecord
  belongs_to :user

  validates :keyword,  presence: true

  def self.update_history(user, keyword)
    history_params = { user: user, keyword: keyword }
    history = find_or_initialize_by(history_params)
    history.update!(**history_params, updated_at: Time.now)
  end
end
