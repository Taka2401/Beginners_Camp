class Camp < ApplicationRecord

  attachment :image

  belongs_to :admin
  has_many :post_images, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
