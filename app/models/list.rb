class List < ApplicationRecord
  belongs_to :user
  has_many :hikes, through: :hikes_lists
end
