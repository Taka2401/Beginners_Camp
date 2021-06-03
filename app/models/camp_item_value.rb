class CampItemValue < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :camp_item

  validates :title, presence: true
  validates :rate, presence: true
end
