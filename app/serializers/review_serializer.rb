class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :rating, :privacy, :username, :images, :updated_at
  has_one :user
  has_one :hike

  def username
    object.user.username
  end


  def images
    images = object.images.map do |image|
      image.service_url if object.images.attached?
    end
  end
end
