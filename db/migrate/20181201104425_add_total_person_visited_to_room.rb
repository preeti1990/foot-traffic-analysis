class AddTotalPersonVisitedToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :total_persons_visited, :integer
  end
end
