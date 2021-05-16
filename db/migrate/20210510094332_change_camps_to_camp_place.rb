class ChangeCampsToCampPlace < ActiveRecord::Migration[5.2]
  def change
    rename_table :camps, :camp_places
  end
end
