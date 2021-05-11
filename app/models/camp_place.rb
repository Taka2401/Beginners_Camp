class Camp_place < ApplicationRecord

  attachment :image

  belongs_to :admin
  has_many :post_images, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
      return Camp_place.all unless search
      Camp_place.where(['name LIKE ?', "%#{search}%"])
  end

end
