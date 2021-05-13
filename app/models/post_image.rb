class PostImage < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :post, optional: true
  belongs_to :camp_place, optional: true
  belongs_to :camp_item, optional: true

  attachment :image

end
