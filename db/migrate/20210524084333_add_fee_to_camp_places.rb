class AddFeeToCampPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :camp_places, :fee, :integer
  end
end
