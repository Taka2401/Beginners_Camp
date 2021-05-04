class Post < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_images, dependent: :destroy

  attachment :image

end
