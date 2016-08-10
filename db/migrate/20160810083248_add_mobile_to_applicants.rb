class AddMobileToApplicants < ActiveRecord::Migration[5.0]
  def change
    rename_column :applicants, :firtname, :first_name
    rename_column :applicants, :lastname, :last_name
    add_column :applicants, :mobile_number, :string
  end
end
