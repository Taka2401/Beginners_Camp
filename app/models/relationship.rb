class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  scope :filter_by_followed, ->(followed_id) { where(followed_id: followed_id) if followed_id }
end
