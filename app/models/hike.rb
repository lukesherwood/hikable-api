class Hike < ApplicationRecord
  include Filterable
  has_many :hike_lists, dependent: :destroy
  has_many :lists, through: :hike_lists
  self.per_page = 12

  scope :filter_by_difficulty, -> (difficulty) { where difficulty: difficulty }
  scope :filter_by_duration, -> (duration) { where('duration LIKE ?', '%' + duration + '%')  }
  scope :filter_by_keyword, -> (title) { where('title LIKE ?', '%' + title + '%') }
end
