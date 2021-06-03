class PostComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post

  validates :comment, presence: true
end
