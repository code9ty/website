class UsersProjectJoinTable < ActiveRecord::Migration[5.0]
  def change
      create_join_table :users, :projects
  end
end
