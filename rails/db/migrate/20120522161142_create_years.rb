class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do 
      t.string :name

      t.timestamps
    end
  end
end
