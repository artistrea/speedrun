include Rails.application.routes.url_helpers

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :description, :name, :photo_url

  def photo_url
    rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end
end
