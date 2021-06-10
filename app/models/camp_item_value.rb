class CampItemValue < ApplicationRecord
  belongs_to :user
  belongs_to :camp_item

  validates :title, presence: true, length: { maximum: 30 }
  validates :rate, presence: true
end
