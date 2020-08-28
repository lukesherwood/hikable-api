class CreateHikesLists < ActiveRecord::Migration[6.0]
  def change
    create_table :hike_lists do |t|
      t.references :hike, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
