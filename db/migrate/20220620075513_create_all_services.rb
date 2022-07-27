class CreateAllServices < ActiveRecord::Migration[7.0]
  def change
    create_table :all_services do |t|
      t.string :category
      t.integer :category_id
      t.string :service_id
      t.string :service
      t.string :migratable
      t.integer :count
      t.string :details
      t.integer :digital_time
      t.integer :branch_time
      t.string :service_image_link
      t.string :service_alt_text
      t.string :cat_image_link
      t.string :cat_alt_text
      t.timestamps
    end
  end
end
