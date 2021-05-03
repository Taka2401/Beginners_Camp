class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :thought
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
