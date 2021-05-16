class CreateCampItemValues < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_item_values do |t|
      t.integer :user_id
      t.integer :camp_item_id
      t.float :rate

      t.timestamps
    end
  end
end
