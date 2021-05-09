class PostImage < ApplicationRecord

  belongs_to :user
  belongs_to :post
  belongs_to :camp

  attachment :image

end
