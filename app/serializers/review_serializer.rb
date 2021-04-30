class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :rating, :privacy, :username, :images
  has_one :user
  has_one :hike

  def username
    object.user.username
  end

  def image
    object.images.service_url if object.images.attached?
  end
end
