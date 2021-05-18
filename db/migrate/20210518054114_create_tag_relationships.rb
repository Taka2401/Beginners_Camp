class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps
    end
  end
end
