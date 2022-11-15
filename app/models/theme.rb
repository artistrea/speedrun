class Theme < ApplicationRecord
    has_many :communities, dependent: :destroy

    validates :name, presence: true, uniqueness: true
end
