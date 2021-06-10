class CampItem < ApplicationRecord
  attachment :image

  belongs_to :admin
  has_many :camp_item_values, dependent: :destroy

  validates :image,  presence: true
  validates :name,  presence: true
  validates :introduction,  presence: true, length: { maximum: 500 }

  def self.search(search)
    return CampItem.all unless search
    CampItem.where(['name LIKE ?', "%#{search}%"])
  end

  def self.rank
    CampItem.find(CampItemValue.group(:camp_item_id).order('avg(rate) desc').limit(3).pluck(:camp_item_id))
  end
end
