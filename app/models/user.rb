class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attachment :image
         attachment :profile_image

         has_many :post_images, dependent: :destroy
         has_many :posts, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :post_comments, dependent: :destroy

         def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
         end

         def self.guest
          find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
            user.password = SecureRandom.urlsafe_base64
          end
         end

end
