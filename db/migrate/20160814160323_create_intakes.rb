class CreateIntakes < ActiveRecord::Migration[5.0]
  def change
    create_table :intakes do |t|
      t.datetime :start_date
      t.datetime :last_date

      t.timestamps
    end
  end
end
