class AddUniquenessInBids < ActiveRecord::Migration[5.0]
  def change
    add_index :bids, [:user_id, :project_id], unique: true
  end
end
