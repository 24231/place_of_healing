class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :place, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
end
