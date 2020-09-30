class ListSerializer < ActiveModel::Serializer
  attributes :name, :id, :description, :user_id, :hikes
  belongs_to :user
  has_many :hikes, through: :hike_lists
end
