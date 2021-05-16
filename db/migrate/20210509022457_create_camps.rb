class CreateCamps < ActiveRecord::Migration[5.2]
  def change
    create_table :camps do |t|
      t.integer :admin_id
      t.string :name
      t.text :introduction
      t.string :address

      t.timestamps
    end
  end
end
