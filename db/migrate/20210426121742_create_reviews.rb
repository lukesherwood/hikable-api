class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.string :privacy, default: "public"
      t.references :user, null: false, foreign_key: true
      t.references :hike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
