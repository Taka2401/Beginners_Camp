class CampPlace < ApplicationRecord

  belongs_to :admin
  has_many :post_images, dependent: :destroy

  accepts_attachments_for :post_images, attachment: :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
      return CampPPlace.all unless search
      CampPlace.where(['name LIKE ?', "%#{search}%"])
  end

end
