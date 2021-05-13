class RemoveImageIdFromCampItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :camp_items, :image_id, :string
  end
end
