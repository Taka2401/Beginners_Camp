class PostImage < ApplicationRecord
  belongs_to :camp_place

  has_one_attached :image, dependent: :destroy
end
