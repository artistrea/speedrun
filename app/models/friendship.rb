class Friendship < ApplicationRecord
  validates :user_id, uniqueness: { scope: :friend_id }

  belongs_to :user
end
