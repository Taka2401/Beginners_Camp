class PostImage < ApplicationRecord
  belongs_to :camp_place

  attachment :image
end
