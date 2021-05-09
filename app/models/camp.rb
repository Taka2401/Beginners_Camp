class Camp < ApplicationRecord

  attachment :image

  belongs_to :admin
  has_many :post_images, dependent: :destroy

end
