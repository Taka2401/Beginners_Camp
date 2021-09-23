class CampPlace < ApplicationRecord
  belongs_to :admin

  has_many :bookmarks, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :camp_place_values, dependent: :destroy
  has_many :post_images, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 500 }
  validates :address, presence: true
  validates :fee, presence: true
  validates :post_images_images, presence: true

  accepts_attachments_for :post_images, attachment: :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    return CampPlace.all unless search
    CampPlace.where(['name LIKE ?', "%#{search}%"])
  end

  def self.rank
    CampPlace.find(CampPlaceValue.group(:camp_place_id).order('avg(rate) desc').limit(3).pluck(:camp_place_id))
  end
end
