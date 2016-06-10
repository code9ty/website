class AddTreasurerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :treasurer, :boolean, default: false
  end
end
