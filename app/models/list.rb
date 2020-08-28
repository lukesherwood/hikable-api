class List < ApplicationRecord
  belongs_to :user
  has_many :hike_lists
  has_many :hikes, through: :hike_lists
end
