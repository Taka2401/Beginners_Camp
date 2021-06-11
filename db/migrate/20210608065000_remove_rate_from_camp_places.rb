class RemoveRateFromCampPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :camp_places, :rate, :float
  end
end
