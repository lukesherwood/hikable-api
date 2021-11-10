class HikeSerializer < ActiveModel::Serializer
  attributes :title, :description, :id, :location, :difficulty, :duration, :length, :photo,
             :directionURL, :routeURL, :duration_category,
             :dog_friendly, :region, :latitude, :longitude
  has_many :reviews # scope by only public
end
