class AddDescriptionToAllService < ActiveRecord::Migration[7.0]
  def change
    add_column :all_services, :description, :string
  end
end
