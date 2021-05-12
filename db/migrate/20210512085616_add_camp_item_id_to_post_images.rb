class AddCampItemIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :camp_item_id, :integer
  end
end
