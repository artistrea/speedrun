class FriendshipSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user
  belongs_to :friend
end
