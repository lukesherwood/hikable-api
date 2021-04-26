class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :privacy, :username
  has_one :user
  has_one :hike

  def username
    object.user.username
  end
end
