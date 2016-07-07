class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :link
      t.string :title

      t.timestamps
    end
  end
end
