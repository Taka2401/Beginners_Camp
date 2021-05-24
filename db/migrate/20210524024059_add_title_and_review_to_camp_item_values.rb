class AddTitleAndReviewToCampItemValues < ActiveRecord::Migration[5.2]
  def change
    add_column :camp_item_values, :title, :string
    add_column :camp_item_values, :review, :text
  end
end
