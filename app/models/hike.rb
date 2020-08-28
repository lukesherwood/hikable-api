class Hike < ApplicationRecord
    has_many :hike_lists
    has_many :lists, through: :hike_lists
end
