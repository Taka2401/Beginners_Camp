class AddTitleAndReviewToCampPlaceValues < ActiveRecord::Migration[5.2]
  def change
    add_column :camp_place_values, :title, :string
    add_column :camp_place_values, :review, :text
  end
end
