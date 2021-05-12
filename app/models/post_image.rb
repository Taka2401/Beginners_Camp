class PostImage < ApplicationRecord

  belongs_to :user
  belongs_to :post
  belongs_to :camp_place
  belongs_to :camp_item

  attachment :image

end
