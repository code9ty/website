class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :university
      t.string :year_of_study
      t.string :github
      t.string :mobile_number
      t.string :email

      t.timestamps
    end
  end
end
