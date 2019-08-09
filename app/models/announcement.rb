class Announcement < ApplicationRecord
  belongs_to :user
  has_one :coop, through: :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(last_comment_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :coop_id, presence: true
end
