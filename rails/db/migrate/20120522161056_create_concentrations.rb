class CreateConcentrations < ActiveRecord::Migration
  def change
    create_table :concentrations do |t|
      t.string :name

      t.timestamps
    end
  end
end
