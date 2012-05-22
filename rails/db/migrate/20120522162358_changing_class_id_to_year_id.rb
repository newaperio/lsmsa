class ChangingClassIdToYearId < ActiveRecord::Migration
  def up
  	rename_column :prospies, :class_id, :year_id
  end

  def down
  	rename_column :prospies, :year_id, :class_id
  end
end
