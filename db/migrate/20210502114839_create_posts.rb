class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :review
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
