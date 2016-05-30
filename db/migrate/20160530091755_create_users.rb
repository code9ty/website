class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :university
      t.string :year_of_study
      t.string :github
      t.string :mobile_number

      t.timestamps
    end
  end
end
