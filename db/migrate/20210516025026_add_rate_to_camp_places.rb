class AddRateToCampPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :camp_places, :rate, :float
  end
end
