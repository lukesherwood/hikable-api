class CreateJoinTableHikesLists < ActiveRecord::Migration[6.0]
  def change
    create_join_table :hikes, :lists do |t|
       t.index [:hike_id, :list_id]
    end
  end
end
