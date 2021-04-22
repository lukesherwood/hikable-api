class HikeSerializer < ActiveModel::Serializer
  attributes :title, :description, :id, :location, :difficulty, :duration, :length, :photo,
  :directionURL, :routeURL, :duration_category,
  :dog_friendly, :region, :coordinates
end
