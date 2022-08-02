class CreatePredictions < ActiveRecord::Migration[7.0]
  def change
    create_table :predictions do |t|
      t.string :branch_name 
      t.string :service
      t.bigint :unixdate
      t.datetime :date
      t.float :prediction
      t.timestamps
    end
  end
end
