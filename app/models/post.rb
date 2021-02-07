class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :user_id, presence: true
  validates :place, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 300 }
  default_scope -> { order(created_at: :desc) }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "画像フォーマットのみ投稿可能です" },
                      size:         { less_than: 5.megabytes,
                                      message: "5MB以上の画像は投稿できません" }
                                      
  def display_image
    image.variant(resize_to_limit:[500,500])
  end
end



