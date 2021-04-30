class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :rating, :privacy, :username
  has_one :user
  has_one :hike

  def username
    object.user.username
  end

  attribute :image do |object|
    object.get_image_url()
  end
end
