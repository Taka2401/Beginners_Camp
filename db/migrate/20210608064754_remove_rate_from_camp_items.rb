class RemoveRateFromCampItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :camp_items, :rate, :float
  end
end
