class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :camp_place
end
