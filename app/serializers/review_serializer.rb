class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :privacy
  belongs_to :user
  belongs_to :hike
end
