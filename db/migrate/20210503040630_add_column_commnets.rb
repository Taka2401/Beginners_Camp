class AddColumnCommnets < ActiveRecord::Migration[5.2]
  def change
    add_column :Comments, :comment, :text
  end
end
