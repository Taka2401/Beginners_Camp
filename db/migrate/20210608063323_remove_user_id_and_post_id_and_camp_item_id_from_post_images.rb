class RemoveUserIdAndPostIdAndCampItemIdFromPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :user_id, :inteder
    remove_column :post_images, :post_id, :integer
    remove_column :post_images, :camp_item_id, :integer
  end
end
