class Hike < ApplicationRecord
  has_many :hike_lists, dependent: :destroy
  has_many :lists, through: :hike_lists
  self.per_page = 12
end
