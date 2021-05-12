class Camp_item < ApplicationRecord

  attachment :image

  belongs_to :admin
  has_many :post_images, dependent: :destroy

end
