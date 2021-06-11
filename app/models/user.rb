class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :camp_item_values, dependent: :destroy
  has_many :camp_place_values, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 10 }
  validates :email, presence: true
  validates :introduction, length: { maximum: 150 }

  def favorited_by?(post)
    favorites.where(post_id: post.id).exists?
  end

  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end



end
