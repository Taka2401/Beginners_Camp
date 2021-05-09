class CreateCamps < ActiveRecord::Migration[5.2]
  def change
    create_table :camps do |t|
      t.string :name
      t.text :introduction
      t.string :image_id

      t.timestamps
    end
  end
end
