class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true
      t.text :learnt
      t.text :problem
      t.integer :rating

      t.timestamps
    end
  end
end
