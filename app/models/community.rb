class Community < ApplicationRecord
  belongs_to :theme

  validates :name, presence: true
end
