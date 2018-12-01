class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :person_id
      t.float :avg_time_spent

      t.timestamps
    end
  end
end
