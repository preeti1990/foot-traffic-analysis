class CreatePersonRoomVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :person_room_visits do |t|
      t.references :person, foreign_key: true
      t.references :room, foreign_key: true
      t.integer :in_time
      t.integer :out_time
      t.integer :time_spent

      t.timestamps
    end
  end
end
