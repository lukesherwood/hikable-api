class AddCoordinatesCategoriesAndRegionToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :dog_friendly, :string, array: true, default: []
    add_column :hikes, :region, :string, array: true, default: []
    add_column :hikes, :duration_category, :string, array: true, default: []
  end
end
