class AddAddressLine2 < ActiveRecord::Migration
  def up
  rename_column :prospies, :address, :address_1
  add_column :prospies, :address_2, :string
  end

  def down
  rename_column :prospies, :address_1, :address
  remove_column :prospies, :address_2
  end
end
