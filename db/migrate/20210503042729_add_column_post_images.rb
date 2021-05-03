class AddColumnPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :image_id, :string
  end
end
