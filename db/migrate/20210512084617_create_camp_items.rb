class CreateCampItems < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_items do |t|
      t.integer :admin_id
      t.string :name
      t.text :introduction
      t.string :image_id

      t.timestamps
    end
  end
end
