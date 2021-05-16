class CampItem < ApplicationRecord

  attachment :image

  belongs_to :admin
  has_many :post_images, dependent: :destroy
  has_many :camp_item_values, dependent: :destroy

end
