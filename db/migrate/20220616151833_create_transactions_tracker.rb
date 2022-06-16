class CreateTransactionsTracker < ActiveRecord::Migration[7.0]

  # Do not run this migration yet
  def change
    create_table :transactions_trackers do |t|
      t.name
      t.timestamps
      # What other fields do we need?
    end
  end
end
