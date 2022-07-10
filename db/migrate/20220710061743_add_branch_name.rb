class AddBranchName < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :bank
      t.string :branch_name
      t.string :branch
      t.string :sms_number
    end
   end
end
