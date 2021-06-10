class CampPlaceValue < ApplicationRecord
  belongs_to :user
  belongs_to :camp_place

  validates :title, presence: true, length: { maximum: 30 }
  validates :review, length: { maximum: 300 }
  validates :rate, presence: true
end

