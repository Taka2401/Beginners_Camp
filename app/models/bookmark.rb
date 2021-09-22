class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :camp_place

  scope :filter_by_camp_place, ->(camp_place_id) { where(camp_place_id: camp_place_id) if camp_place_id }
end
