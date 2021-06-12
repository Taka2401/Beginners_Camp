class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :post_id
      t.integer :camp_place_id

      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
