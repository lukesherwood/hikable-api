class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  has_many_attached :images

  def get_image_url
    url_for(images) if images.attached?
  end
end
