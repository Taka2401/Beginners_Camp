class CampPlaceValue < ApplicationRecord
  belongs_to :user
  belongs_to :camp_place

  validates :title, presence: true, length: { maximum: 30 }
  validates :rate, presence: true
end

