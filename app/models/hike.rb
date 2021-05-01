class Hike < ApplicationRecord
  include Filterable
  has_many :hike_lists, dependent: :destroy
  has_many :lists, through: :hike_lists
  has_many :reviews
  self.per_page = 12

  scope :filter_by_difficulty, ->(difficulty) { where difficulty: difficulty }
  scope :filter_by_duration_category, lambda { |duration_category|
                                        where duration_category: duration_category
                                      }                                       # this is probably missing the categories in an array [short, medium] etc
  scope :filter_by_keyword, ->(title) { where('title LIKE ?', '%' + title + '%') }
end
