class AddDeepLinkToAllServices < ActiveRecord::Migration[7.0]
  def change
    add_column :all_services, :deep_link, :string
  end
end
