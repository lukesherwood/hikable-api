class HikeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :location, :difficulty, :duration, :length, :photo, :directionURL, :routeURL
end
