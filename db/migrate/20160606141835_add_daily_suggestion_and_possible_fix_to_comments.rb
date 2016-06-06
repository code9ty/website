class AddDailySuggestionAndPossibleFixToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :suggestions, :text
    add_column :comments, :possible_fix, :text
  end
end
