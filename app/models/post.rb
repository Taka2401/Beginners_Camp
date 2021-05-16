class Post < ApplicationRecord

  attachment :image

  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
