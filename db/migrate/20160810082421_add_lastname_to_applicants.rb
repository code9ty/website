class AddLastnameToApplicants < ActiveRecord::Migration[5.0]
  def change
   rename_column :applicants, :name, :firtname 
    add_column :applicants, :lastname, :string
  end
end
