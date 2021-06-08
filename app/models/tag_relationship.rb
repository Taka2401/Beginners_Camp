class TagRelationship < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :tag, optional: true
  validates :post_id, presence: true
  validates :tag_id, presence: true
end
