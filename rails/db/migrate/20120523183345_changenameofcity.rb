class Changenameofcity < ActiveRecord::Migration
  def up
  	rename_column :prospies, :cities, :city
  end

  def down
  rename_column :prospies, :city, :cities
  end
end
