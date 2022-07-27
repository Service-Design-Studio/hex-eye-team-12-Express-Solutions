class CreateDurations < ActiveRecord::Migration[7.0]
  def change
    create_table :durations do |t|
      t.string :branch
      t.string :branch_id
      t.integer :wait_time

      t.timestamps
    end
  end
end
