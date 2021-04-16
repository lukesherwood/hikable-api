class AddCitextToHikes < ActiveRecord::Migration[6.0]
  def change
    enable_extension :citext
    change_column :hikes, :title, :citext
    add_index :hikes, :title, unique: true # If you want to index the product names
  end
end
