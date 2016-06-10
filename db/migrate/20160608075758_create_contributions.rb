class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.belongs_to :user, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
