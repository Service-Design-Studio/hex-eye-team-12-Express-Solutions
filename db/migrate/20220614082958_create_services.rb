class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|


      t.string 'name'
      t.text 'description'
      t.text 'requirements'
      t.datetime 'ttc'
      t.string 'service_id'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end