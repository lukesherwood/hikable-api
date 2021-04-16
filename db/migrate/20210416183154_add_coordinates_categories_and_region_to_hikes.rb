class AddCoordinatesCategoriesAndRegionToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :dog_friendly, :boolean
    add_column :hikes, :region, :string
    add_column :hikes, :coordinates, :string
    add_column :hikes, :duration_category, :string
  end
end
