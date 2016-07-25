class AddStartDateToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :start_date, :datetime
  end
end
