class PostImage < ApplicationRecord

  belongs_to :user
  belongs_to :post
  belongs_to :camp_place

  attachment :image

end
