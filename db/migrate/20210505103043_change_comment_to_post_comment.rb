class ChangeCommentToPostComment < ActiveRecord::Migration[5.2]
  def change
    rename_table :Comments, :post_comments
  end
end
