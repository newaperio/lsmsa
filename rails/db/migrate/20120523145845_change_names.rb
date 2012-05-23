class ChangeNames < ActiveRecord::Migration
  def up
  rename_column :prospies, :Cities, :cities
  rename_column :prospies, :State, :state
  rename_column :prospies, :Zip, :zip
  rename_column :prospies, :Telephone_Number, :telephone_number
  end

  def down
  rename_column :prospies, :cities, :Cities
  rename_column :prospies, :state, :State
  rename_column :prospies, :zip, :Zip
  rename_column :prospies, :telephone_number, :Telephone_Number
  
  end
end
