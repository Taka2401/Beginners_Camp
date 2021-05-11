class ChangeCampsToCampPlace < ActiveRecord::Migration[5.2]
  def change
    rename_table :Camps, :camp_places
  end
end
