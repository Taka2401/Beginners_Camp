class AddMapToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :latitude, :float
    add_column :camps, :longitude, :float
  end
end
