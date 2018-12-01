class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.float :avg_time_spent

      t.timestamps
    end
  end
end
