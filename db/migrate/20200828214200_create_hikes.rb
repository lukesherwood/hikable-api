class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.string :title
      t.string :description
      t.string :location, array: true, default: []
      t.string :difficulty, array: true, default: []
      t.string :duration
      t.string :length
      t.string :photo
      t.string :directionURL
      t.string :routeURL
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
