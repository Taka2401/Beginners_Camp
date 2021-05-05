class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :favorites, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :post_images, dependent: :destroy
         has_many :posts, dependent: :destroy

         attachment :image
         attachment :profile_image
end
