class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  has_many_attached :images

  scope :public_reviews, -> { where privacy: 'public' }
end
