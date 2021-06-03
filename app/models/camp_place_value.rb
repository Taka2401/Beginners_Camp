class CampPlaceValue < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :camp_place

  validates :title, presence: true
  validates :rate, presence: true
end
