class CreateProspies < ActiveRecord::Migration
  def change
    create_table :prospies do |t|
      t.string :name
      t.string :email
      t.string :address
      t.text :interest
      t.string :high_school
	  t.integer :concentration_id
	  t.integer :class_id
      t.timestamps
    end
  end
end
