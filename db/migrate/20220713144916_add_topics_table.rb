class AddTopicsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :topic
    end
  end
end
