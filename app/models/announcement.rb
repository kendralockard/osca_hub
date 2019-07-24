class Announcement < ApplicationRecord
  belongs_to :user
  has_one :group, through: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
end
