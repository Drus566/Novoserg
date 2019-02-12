class Micropost < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 600 }
end
