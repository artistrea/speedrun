class Community < ApplicationRecord
  belongs_to :theme
  has_many :posts, dependent: :destroy

  validates :name, presence: true
end
