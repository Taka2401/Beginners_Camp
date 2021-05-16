class AddRateToCampItems < ActiveRecord::Migration[5.2]
  def change
    add_column :camp_items, :rate, :float
  end
end
