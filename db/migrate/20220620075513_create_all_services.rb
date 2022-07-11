class CreateAllServices < ActiveRecord::Migration[7.0]
  def change
    create_table :all_services do |t|
      t.string :category
      t.string :category_int
      t.string :service
      t.string :migratable
      t.integer :count
      t.string :details
      t.integer :digital_time
      t.integer :branch_time
      t.timestamps
    end
  end
end
