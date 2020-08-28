class Hike < ApplicationRecord
    has_many :lists, through: :hikes_lists
    has_many :users, through: :lists
end
