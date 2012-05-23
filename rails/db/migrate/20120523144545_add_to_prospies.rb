class AddToProspies < ActiveRecord::Migration
  def up
  add_column :prospies, :Cities, :string
  add_column :prospies, :State, :string
  add_column :prospies, :Zip, :integer
  add_column :prospies, :Telephone_Number, :string
  end

  def down
  remove_column :prospies, :Cities
  remove_column :prospies, :State
  remove_column :prospies, :Zip 
  remove_column :prospies, :Telephone_Number
  end
end
