class ChangeValuesToCampPlaceValues < ActiveRecord::Migration[5.2]
  def change
    rename_table :values, :camp_place_values
  end
end
