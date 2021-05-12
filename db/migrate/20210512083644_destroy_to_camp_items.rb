class DestroyToCampItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :camp_items
  end
end
