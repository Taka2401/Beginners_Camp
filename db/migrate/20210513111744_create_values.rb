class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
      t.integer :user_id
      t.integer :camp_place_id
      t.float :rate

      t.timestamps
    end
  end
end
