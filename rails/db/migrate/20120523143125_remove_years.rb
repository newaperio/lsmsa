class RemoveYears < ActiveRecord::Migration
  def up
  drop_table :years
  remove_column :prospies, :year_id
  add_column :prospies, :year, :string
  
  end

  def down
    create_table :years do |t|
	  t.string :name
	  t.timestamps
	  add_column :prospies, :year_id, :integer
	  remove_column :prospies, :year
	end
  end
end
