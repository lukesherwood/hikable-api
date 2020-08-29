class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :picture, :lists, :hikes
  has_many :lists
  has_many :hikes, through: :lists
end
