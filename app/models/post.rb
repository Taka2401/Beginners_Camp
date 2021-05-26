class Post < ApplicationRecord

  attachment :image

  belongs_to :user

  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :title,  presence: true
  validates :image,  presence: true



  def save_tags(savepost_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags

    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      tags << post_tag
    end
  end


end
